//
//  WorkWebViewViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 22/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import WebKit

class WorkWebViewViewController: BaseViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var url: URL!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: url))
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
}
