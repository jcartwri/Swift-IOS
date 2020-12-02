//
//  WebVC.swift
//  Rush00
//
//  Created by Дмитрий on 28.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit
import WebKit


class WebVC: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    var apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        guard let url = apiManager.startAuthentificationURL else { return }
        let request = URLRequest(url: url)
        removeCookies()
        
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
        let navType = navigationAction.navigationType

        if navType == .formSubmitted || navType == .other {
            if let url = navigationAction.request.url {
                if url.host == "oauth2callback" {
                    apiManager.continueAuthentification(url: url) {
                        DispatchQueue.main.async { [weak self] in
                            self?.dismiss(animated: true) {
                            }
                        }
                    }
                    decisionHandler(.cancel)
                    return
                }
                decisionHandler(.allow)
                return
            }
        }
    }
    
    func removeCookies(){
        let cookieStore = webView.configuration.websiteDataStore.httpCookieStore

        cookieStore.getAllCookies {
            cookies in

            for cookie in cookies {
                cookieStore.delete(cookie)
            }
        }
    }
}

extension WebVC {
    static func storyboardInstance() -> WebVC {
        guard let vc = UIStoryboard(name: String(describing: self), bundle: nil).instantiateInitialViewController() as? WebVC else { fatalError() }
        return vc
    }
}
