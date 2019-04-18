//
//  CorrespondentListVCViewController.swift
//  HerseyDispatch
//
//  Created by Michael Murphy on 4/3/19.
//  Copyright © 2019 Michael Murphy. All rights reserved.
//

import UIKit
import Firebase


class CorrespondentListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var correspondentListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("correspondent loaded")
        correspondentListTableView.delegate = self
        correspondentListTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
