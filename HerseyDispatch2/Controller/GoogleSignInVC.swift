//
//  GoogleSignInVC.swift
//  HerseyDispatchh
//
//  Created by Maxtan E. Huynh on 12/11/18.
//  Copyright © 2018 Dispatch Team. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class GoogleSignInVC: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var googleSignInBtn: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didSignIn), name: NSNotification.Name("SuccessfulSignInNotification"), object: nil)
        GIDSignIn.sharedInstance()?.uiDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @objc func didSignIn()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
