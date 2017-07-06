//
//  WebViewController.swift
//  BNR_Ch3_7_GlobeTrotter
//
//  Created by Magela Moore on 7/4/17.
//  Copyright © 2017 Rainbow Interactive. All rights reserved.
//  Reference: https://developer.apple.com/documentation/webkit/wkwebview#see-also

import Foundation
import WebKit


class WkWebViewController: UIViewController, WKUIDelegate {
    
    //Globals
    var wkWebView: WKWebView! // (!) =  implicitly unwrapped optional
    let siteURL = URL(string: "https://developer.android.com/index.html")
    
    // Progromatically load the view
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        wkWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        wkWebView.uiDelegate = self
        view = wkWebView
    }
    
    //Load the request in the web view
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: siteURL!)
        wkWebView.load(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
