//
//  ViewController.swift
//  WebViewExample
//
//  Created by Kyle Ohanian on 7/13/18.
//  Copyright © 2018 Kyle Ohanian. All rights reserved.
//

import UIKit
import WebKit



class ViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    
    lazy var wkWebView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        configuration.userContentController.add(self, name: "handler1")
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.isScrollEnabled = true
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = false
        view.addSubview(webView)
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let resourcePath = Bundle.main.bundlePath
        let pathURL = URL.init(fileURLWithPath: resourcePath)
        let html = Bundle.main.path(forResource: "example", ofType: "html")
        do {
            let content = try String(contentsOf: URL.init(fileURLWithPath: html!), encoding: String.Encoding.utf8)
            wkWebView.loadHTMLString(content, baseURL: pathURL)
        }
        catch let error {}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // TODO
        if(message.name == "handler1") {
            print("Message From button pressed: \(message.body)")
        }
    }


}

