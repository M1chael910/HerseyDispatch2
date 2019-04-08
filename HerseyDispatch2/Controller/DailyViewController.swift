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

class DailyViewController: UIViewController {
    @IBOutlet weak var dailyWebView: WKWebView!
    var dailyURL = URL(string: "http://www.africau.edu/images/default/sample.pdf")
    override func viewDidLoad() {
        super.viewDidLoad()
        let dailyRequest = URLRequest(url: dailyURL!)
        dailyWebView.load(dailyRequest)
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

