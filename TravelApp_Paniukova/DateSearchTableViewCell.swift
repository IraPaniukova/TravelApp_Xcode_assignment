//
//  DateSearchTableViewCell.swift
//  TravelApp_Paniukova
//
//  Created by user196194 on 10/1/23.
//

import UIKit

class DateSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
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
