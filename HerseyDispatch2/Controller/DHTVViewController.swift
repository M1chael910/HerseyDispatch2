//
//  DHTVViewController.swift
//  HerseyDispatch
//
//  Created by Maxtan E. Huynh on 12/11/18.
//  Copyright © 2018 Dispatch Team. All rights reserved.
//

import UIKit
import WebKit
import Firebase


class DHTVViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var dhtvWebView: WKWebView!
    @IBOutlet weak var loadingView: UIImageView!
    let dhtvURL = URL(string: "https://www.youtube.com/channel/UCIpBIAw41obYEzf4UW0aIXQ/featured")
    override func viewDidLoad() {
        super.viewDidLoad()
        dhtvWebView.navigationDelegate = self
        loadingView.alpha = 1
        let urlRequest = URLRequest(url: dhtvURL!)
        dhtvWebView.load(urlRequest)
        print("load")
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.alpha = 0
        print("works!")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Analytics.logEvent("DHTV_pressed", parameters: nil)
    }
    
    /*
     // MANavigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
