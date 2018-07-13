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
        configuration.userContentController.add(self, name: "interop")
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.isScrollEnabled = true
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = false
        view.addSubview(webView)
        let constraintTop = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let constraintBottom = NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let constraintLeading = NSLayoutConstraint(item: webView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let constraintTrailing = NSLayoutConstraint(item: webView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([constraintTop, constraintBottom, constraintLeading, constraintTrailing])
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
        if(message.name == "interop") {
            print("Message From button pressed: \(message.body)")
        }
    }


}

