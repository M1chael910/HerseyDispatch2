//
//  CorrespondentViewController.swift
//  HerseyDispatch
//
//  Created by Maxtan E. Huynh on 12/11/18.
//  Copyright © 2018 Dispatch Team. All rights reserved.
//

import UIKit
import WebKit
import Firebase
import GoogleSignIn
import SafariServices

class CorrespondentViewController: UIViewController, UIWebViewDelegate {
    
    let correspondentURL = URL(string: "https://www.herseydispatch.com/copy-of-entertainment")
    var didLoad = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if didLoad == false {
            let config = SFSafariViewController.Configuration()
            let vc = SFSafariViewController(url: correspondentURL!, configuration: config)
            present(vc, animated: true)
            didLoad = true
        } else {
            didLoad = false
        }

    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


