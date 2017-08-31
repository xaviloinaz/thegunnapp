//
//  StaffTableViewCell.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 6/19/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import UIKit

class StaffTableViewCell: UITableViewCell {

    @IBOutlet weak var staffName: UILabel!
    @IBOutlet weak var staffDepartment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
