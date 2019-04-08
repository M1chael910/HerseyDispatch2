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

class HowlViewController: UIViewController {
    @IBOutlet weak var howlWebView: WKWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        openAppOrStore(AppScheme: "Spotify://", StoreID: "id324684580")
    }
    
    func openAppOrStore(AppScheme: String, StoreID: String){
        let Appurl = URL(string: AppScheme)
        
        if UIApplication.shared.openURL(Appurl!) == true
        {
            UIApplication.shared.canOpenURL(Appurl!)
        }
        else{
            let Storeurl = URL(string: "itms-apps://itunes.apple.com/us/app/spotify-music-and-podcasts/id324684580?mt=8")
            if UIApplication.shared.canOpenURL(Storeurl!) == true
            {
                UIApplication.shared.canOpenURL(Storeurl!)
            }
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        Analytics.logEvent("howl_pressed", parameters: nil)
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
