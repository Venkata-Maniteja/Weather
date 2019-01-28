//
//  WeatherCell.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 28/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var background : UIImageView!
    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var temp : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
