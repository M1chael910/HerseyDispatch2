//
//  CorrespondentCell.swift
//  HerseyDispatch
//
//  Created by Michael Murphy on 2/25/19.
//  Copyright © 2019 Michael Murphy. All rights reserved.
//

import UIKit

class CorrespondentCell: UITableViewCell {
    
    @IBOutlet weak var correspondentTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func updateCell(for url: String) {
        correspondentTitleLbl.text = url
        
    }

}
