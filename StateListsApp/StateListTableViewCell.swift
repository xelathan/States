//
//  StateListTableViewCell.swift
//  StateListsApp
//
//  Created by Alex Tran on 10/26/20.
//

import UIKit

class StateListTableViewCell: UITableViewCell {
    @IBOutlet weak var stateName: UILabel!
    @IBOutlet weak var stateFlag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        stateName.lineBreakMode = NSLineBreakMode.byWordWrapping
        stateName.numberOfLines = 0
        
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }

}
