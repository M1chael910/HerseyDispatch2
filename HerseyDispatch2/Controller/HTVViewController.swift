//
//  HTVViewController.swift
//  HerseyDispatch
//
//  Created by Maxtan E. Huynh on 12/11/18.
//  Copyright © 2018 Dispatch Team. All rights reserved.
//

import UIKit
import WebKit
import Firebase


class HTVViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var loadingView: UIImageView!
    @IBOutlet weak var HTVWebView: WKWebView!
    let url = URL(string: "https://www.youtube.com/channel/UCa8OF8x9A3zL9lYNaefrw3A")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadingView.alpha = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Analytics.logEvent("HTVV_pressed", parameters: nil)
        HTVWebView.navigationDelegate = self

        let urlRequest = URLRequest(url: url!)
        HTVWebView.load(urlRequest)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.alpha = 0
    }
    
    
    
    
}
