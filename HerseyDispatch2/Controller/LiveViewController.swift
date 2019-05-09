//
//  LiveViewController.swift
//  HerseyDispatch
//
//  Created by Maxtan E. Huynh on 12/11/18.
//  Copyright © 2018 Dispatch Team. All rights reserved.
//

import UIKit
import WebKit
import Firebase


class LiveViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var liveWebView: WKWebView!
    @IBOutlet weak var loadingView: UIImageView!
    
    let liveURL = URL(string: "https://www.youtube.com/playlist?list=PL6pl4znCi1SWvKRAVBg1d9sftWJkzYjav")
    override func viewDidLoad() {
        super.viewDidLoad()
        liveWebView.navigationDelegate = self
        loadingView.alpha = 1
        let urlRequest = URLRequest(url: liveURL!)
        liveWebView.load(urlRequest)
        print("load")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.alpha = 0
        print("works!")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Analytics.logEvent("live_pressed", parameters: nil)

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
