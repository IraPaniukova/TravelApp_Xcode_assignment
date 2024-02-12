//
//  DisplayTableViewCell.swift
//  TravelApp_Paniukova
//
//  Created by user196194 on 9/25/23.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    
    @IBOutlet weak var AdrsLabel: UILabel!
    
    @IBOutlet weak var DcrptnLabel: UILabel!
    
    @IBOutlet weak var ImgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
