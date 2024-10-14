//
//  PlacementTableViewCell.swift
//  Aug_24_ContainerViews_Demo
//
//  Created by Vishal Jagtap on 14/10/24.
//

import UIKit

class PlacementTableViewCell: UITableViewCell {

    
    @IBOutlet weak var placedStudentNameLabel: UILabel!
    
    @IBOutlet weak var placedStudentCompanyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
    }
    
}
