//
//  DailyViewController.swift
//  HerseyDispatch2
//
//  Created by Maxtan E. Huynh on 4/8/19.
//  Copyright © 2019 Michael  Murphy. All rights reserved.
//

import UIKit
import WebKit
import Firebase
import GoogleSignIn

class DailyViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var dailyWebView: WKWebView!
    @IBOutlet weak var loadingView: UIImageView!
    var dailyURL = URL(string: "https://drive.google.com/file/d/1GUAAtEA769ZH3Z5vn-azvag79yvOUzSQ/view?usp=sharing")
    override func viewDidLoad() {
        super.viewDidLoad()
        let dailyRequest = URLRequest(url: dailyURL!)
        dailyWebView.load(dailyRequest)
        loadingView.alpha = 1
        dailyWebView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.alpha = 0
        print("works!")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        Analytics.logEvent("daily_pressed", parameters: nil)

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

