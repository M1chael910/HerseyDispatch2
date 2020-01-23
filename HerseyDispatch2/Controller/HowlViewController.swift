//
//  HowlViewController.swift
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

class HowlViewController: UIViewController, SFSafariViewControllerDelegate {
    var didLoad = false
    var howlURL = URL(string: "https://open.spotify.com/show/4GWy4SoByapLHcHj6arT1J")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("here")
        if didLoad == false {
            let config = SFSafariViewController.Configuration()
            let vc = SFSafariViewController(url: howlURL!, configuration: config)
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
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        openAppOrStore(AppScheme: "Spotify://", StoreID: "id324684580")
//    }
//
//    func openAppOrStore(AppScheme: String, StoreID: String){
//        let Appurl = URL(string: AppScheme)
//
//        if UIApplication.shared.canOpenURL(Appurl!) == true
//        {
//            UIApplication.shared.openURL(Appurl!)
//        }
//        else{
//            let Storeurl = URL(string: "itms-apps://itunes.apple.com/us/app/spotify-music-and-podcasts/id324684580?mt=8")
//
//            UIApplication.shared.openURL(Storeurl!)
//
//        }
//    }
//
//
//    override func viewDidAppear(_ animated: Bool) {
//        Analytics.logEvent("howl_pressed", parameters: nil)
//    }
//
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
