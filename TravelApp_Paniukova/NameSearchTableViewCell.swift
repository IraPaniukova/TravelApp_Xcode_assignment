//
//  NameSearchTableViewCell.swift
//  TravelApp_Paniukova
//
//  Created by user196194 on 9/27/23.
//

import UIKit

class NameSearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var adrsLabel: UILabel!
    
    @IBOutlet weak var dscrptnLabel: UILabel!
   
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
