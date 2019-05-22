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
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var middleImageView: UIImageView!
    @IBOutlet weak var googleSignInBtn: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImages()
        NotificationCenter.default.addObserver(self, selector: #selector(didSignIn), name: NSNotification.Name("SuccessfulSignInNotification"), object: nil)
        GIDSignIn.sharedInstance()?.uiDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchImages()
    }
    
    @objc func didSignIn()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    func fetchImages() {
        
        
        
        var fetchedImages: [UIImage] = []
        var images: [String] = []
        let DB = Firestore.firestore()
        let storage = Storage.storage()
        
        DB.collection("Images").getDocuments { (snap, err) in
            if let snap = snap {
                for doc in snap.documents {
                    for value in doc.data().values {
                        let string = value as! String
                        images.append(string)
                    }
                }
            }
            
            for imageString in images {
                let pathReference = storage.reference(withPath: "Home Page Pictures/\(imageString)")
                print(pathReference)
                pathReference.getData(maxSize: 1 * 10000 * 10000) { (data, err) in
                    if let data = data {
                        if let image = UIImage(data: data) {
                            fetchedImages.append(image)
                        }
                    }
                }
            }
            
            for image in fetchedImages {
                if image.accessibilityIdentifier == "HerseyLogo.png" {
                    self.middleImageView.image = image
                } else if image.accessibilityIdentifier == "herseyFootball.jpeg"{
                    self.leftImageView.image = image
                } else if image.accessibilityIdentifier == "cassidyFire.jpg" {
                    self.rightImageView.image = image
                }
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
