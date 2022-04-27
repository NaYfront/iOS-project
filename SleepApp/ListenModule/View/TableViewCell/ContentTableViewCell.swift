//
//  ContentTableViewCell.swift
//  SleepApp
//
//  Created by NaYfront on 27.04.2022.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var contentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
