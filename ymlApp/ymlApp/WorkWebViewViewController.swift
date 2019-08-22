//
//  WorkWebViewViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 22/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import WebKit

class WorkWebViewViewController: UIViewController,WKNavigationDelegate {
    var webView: WKWebView!
    var url: URL!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://ioscreator.com")!
        webView.load(URLRequest(url: url))
        
    }
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
   
}
