//
//  EmployeeListTableViewCell.swift
//  Machine_Task_Ranjana
//
//  Created by Ranjana Sharma on 15/04/20.
//  Copyright © 2020 Ranjana Sharma. All rights reserved.
//

import UIKit

class EmployeeListTableViewCell: UITableViewCell {
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSalary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
