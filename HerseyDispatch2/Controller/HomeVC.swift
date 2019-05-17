//
//  HomeVC.swift
//  HerseyDispatch
//
//  Created by Maxtan E. Huynh on 12/12/18.
//  Copyright © 2018 Dispatch Team. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import CoreFoundation



class HomeVC: UIViewController {
    
    @IBOutlet weak var slideshowImageView: UIImageView!
    
    var ref: CollectionReference? = nil
    var slideshowImagesArray: [UIImage] = []
    

    override func  viewDidLoad() {
        super.viewDidLoad()
        fetchImages()
        
        if slideshowImagesArray.isEmpty == false {
            var slideshowTimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(HomeVC.changeImage), userInfo: nil, repeats: true)
        }
    
    }
    
    func fetchImages() {
        
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
                        let image = UIImage(data: data)
                        self.slideshowImagesArray.append(image!)
                    }
                }
            }
        }
    }
    
    @objc func changeImage() {
        var number = Int.random(in: 0...slideshowImagesArray.count - 1)
        if slideshowImagesArray[number] == slideshowImageView.image {
            if number == slideshowImagesArray.count - 1 {
                slideshowImageView.image = slideshowImagesArray[0]
            } else {
                slideshowImageView.image = slideshowImagesArray[number + 1]
            }
        } else {
            slideshowImageView.image = slideshowImagesArray[number]
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Analytics.logEvent("home_pressed", parameters: nil)
    }
    

    @IBAction func hamburgerBtnPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Menu", message: "Welcome to the menu!", preferredStyle: .alert)
        
        let signOutAction = UIAlertAction(title: "Sign Out", style: .cancel) { (action:UIAlertAction) in
            GIDSignIn.sharedInstance()?.signOut()
            let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let SignInVC = storyBoard.instantiateViewController(withIdentifier: "GoogleSignInVC")
            self.present(SignInVC, animated: true, completion: nil);
        }
        let exitAction = UIAlertAction(title: "Cancel", style: .default) {(action:UIAlertAction) in
            alert.dismiss(animated: true, completion: nil);
        }
        
        alert.addAction(signOutAction)
        alert.addAction(exitAction)
        self.present(alert, animated: true)
    }
    @IBAction func signOutBtnPressed(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signOut()
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let SignInVC = storyBoard.instantiateViewController(withIdentifier: "GoogleSignInVC")
        self.present(SignInVC, animated: true, completion: nil)
    }
    
}
