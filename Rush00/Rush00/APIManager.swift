//
//  APIManager.swift
//  Rush00
//
//  Created by Дмитрий on 28.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol IAPIMeneger {
    var startAuthentificationURL: URL? { get }
    func continueAuthentification(url: URL, completion: (() -> Void)?)
    func getUserData(completion: @escaping (User?) -> Void)
    func getAllEvents(completion: @escaping ([Event]?) -> Void)
}

class APIManager: IAPIMeneger {
    func getAllEvents(completion: @escaping ([Event]?) -> Void) {
        if let request = getRequest(atEndpoint: "events") {
            URLSession.shared.dataTask(with: request) { data, _, _ in
                if let data = data {
                    let events = JSON(data).arrayValue
                    var allEvents: [Event] = []
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'sssZ'"
                    for event in events {
                        guard
                            let name = event["name"].string,
                            let description = event["description"].string,

                            let nbrRegistred = event["nbr_subscribers"].int,
                            let location = event["location"].string,
                            let type = event["kind"].string,
                            var startTime = event["begin_at"].string,
                            var endTime = event["end_at"].string,
                            let campusIds = event["campus_ids"].arrayObject,
                            let cursusIds = event["cursus_ids"].arrayObject
                            else {
                                completion(nil)
                                return
                        }
                        var duration = ""
                        if let startDate = dateFormatter.date(from: startTime),
                            let endDate = dateFormatter.date(from: endTime) {
                            startTime = dateFormatter.string(from: startDate)
                            endTime = dateFormatter.string(from: endDate)
                            duration = String(format: "%.1f", (endDate.timeIntervalSinceReferenceDate - startDate.timeIntervalSinceReferenceDate) / 3600) + " hour(s)"
                        }
                        if let endDate = dateFormatter.date(from: endTime) {
                            endTime = dateFormatter.string(from: endDate)
                        }
                        
                        let maxGuests = event["max_people"].int ?? 0
                        var campuses = [Int]()
                        var curses = [Int]()
                        for campus in campusIds {
                            if let id = campus as? Int {
                                campuses.append(id)
                            }
                        }
                        for curse in cursusIds {
                            if let id = curse as? Int {
                                curses.append(id)
                            }
                        }
                        allEvents.append(Event(name: name,
                                               description: description,
                                               maxGuests: maxGuests,
                                               nbrRegistred: nbrRegistred,
                                               location: location,
                                               type: type,
                                               startTime: startTime,
                                               endTime: endTime,
                                               campuses: campuses,
                                               cursuses: curses,
                                               duration: duration))
                    }
                    completion(allEvents)
                }
            }.resume()
        } else {
            completion(nil)
        }
    }
    
    
    func getUserData(completion: @escaping (User?) -> Void) {
        if let request = getRequest(atEndpoint: "me") {
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    let json = JSON(data)
                    guard
                        let userName = json["first_name"].string,
                        let userSurname = json["last_name"].string,
                        let userLogin = json["login"].string,
                        let userSyllabuses = json["cursus_users"].array
                        else {
                            completion(nil)
                            return
                    }
                    var user = User(name: userName,
                                    surname: userSurname,
                                    login: userLogin,
                                    image: nil,
                                    curses: [])
                    for syllabus in userSyllabuses {
                        guard
                            let syllabusLevel = syllabus["level"].float,
                            let syllabusName = syllabus["cursus"]["name"].string
                            else {
                                completion(user)
                                return
                        }
                        user.curses.append(Syllabus(name: syllabusName, level: syllabusLevel))
                    }
                    guard let stringImageURL = json["image_url"].string,
                        let imageURL = URL(string: stringImageURL),
                        let imageData = try? Data(contentsOf: imageURL),
                        let image = UIImage(data: imageData)
                        else {
                            completion(user)
                            return
                    }
                    user.image = image
                    completion(user)
                } else {
                    completion(nil)
                }
            }.resume()
        } else {
            completion(nil)
        }
    }
    
    var startAuthentificationURL: URL? {
        let ud = UserDefaults.standard
        guard
            let baseURL = ud.string(forKey: "baseURL"),
            let uid = ud.string(forKey: "uid"),
            let uri = ud.string(forKey: "uri")
            else { fatalError() }
        let urlString = "\(baseURL)client_id=\(uid)&redirect_uri=\(uri)&response_type=code"
        return URL(string: urlString)
    }
    
    func continueAuthentification(url: URL, completion: (() -> Void)?) {
        let ud = UserDefaults.standard
        guard
            let uid = ud.string(forKey: "uid"),
            let secret = ud.string(forKey: "secrete"),
            let uri = ud.string(forKey: "redirectURI")
            else {
                completion?()
                return
        }
        var codeValue: String?
        
        guard
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let queryItems = components.queryItems
            else {
                completion?()
                return
        }
        for item in queryItems {
            if item.name.lowercased() == "code" {
                codeValue = item.value
            } else if item.name.lowercased() == "error" {
                completion?()
                return
            }
        }
        
        guard let code = codeValue,
            let baseURLString = UserDefaults.standard.string(forKey: "continueAuthentificationBaseURL"),
            let baseURL = URL(string: baseURLString)
            else {
                completion?()
                return
        }
        
        let tokenParams = [
            "grant_type": "authorization_code",
            "client_id": uid,
            "client_secret": secret,
            "code": code,
            "redirect_uri": uri
        ]
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.httpBody = tokenParams.percentEscaped().data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion?()
                return
            }
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                let ud = UserDefaults.standard
                guard let token = json["access_token"] as? String,
                    let refreshToken = json["refresh_token"] as? String
                    else {
                        completion?()
                        return
                }
                ud.set(token, forKey: "accessToken")
                ud.set(refreshToken, forKey: "refreshToken")
                ud.set(true, forKey: "isAuthorised")
                completion?()
            }
        }.resume()
    }
    
    private func getRequest(atEndpoint endpoint: String) -> URLRequest? {
        let base = "https://api.intra.42.fr/v2/\(endpoint)?"
        guard
            let url = URL(string: base),
            
            let token = UserDefaults.standard.string(forKey: "accessToken") else { return nil }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
    
}
