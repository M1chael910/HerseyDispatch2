//
//  CorrespondentViewController.swift
//  HerseyDispatch
//
//  Created by Maxtan E. Huynh on 12/11/18.
//  Copyright © 2018 Dispatch Team. All rights reserved.
//

import UIKit
import WebKit

class CorrespondentViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var correspondentWebView: WKWebView!
    var selectedDocument = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(selectedDocument)")
        print("view loaded")
        let correspondentURL = URL(string: selectedDocument)
        let correspondentRequest = URLRequest(url: (correspondentURL)!)
        correspondentWebView.load(correspondentRequest)
        // Do any additional setup after loading the view.
    }
    @IBAction func correspondentBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
