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
import SafariServices


class DailyViewController: UIViewController, SFSafariViewControllerDelegate {
     
    var didLoad = false
    @IBOutlet weak var loadingView: UIImageView!
    var dailyURL = URL(string: "https://drive.google.com/file/d/1GUAAtEA769ZH3Z5vn-azvag79yvOUzSQ/view?usp=sharing")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.alpha = 1

    }
    override func viewDidAppear(_ animated: Bool) {
        print("here")
        if didLoad == false {
            let config = SFSafariViewController.Configuration()
            let vc = SFSafariViewController(url: dailyURL!, configuration: config)
            vc.delegate = self
            present(vc, animated: true)
            didLoad = true
        } else {
           didLoad = false
        }
    
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("done")
        self.tabBarController!.selectedIndex = 0
    }
}

