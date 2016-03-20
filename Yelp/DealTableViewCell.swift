//
//  DealTableViewCell.swift
//  Yelp
//
//  Created by Ngoc Do on 3/20/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import SevenSwitch

class DealTableViewCell: UITableViewCell {
    let mySwitch = SevenSwitch()
    @IBOutlet weak var viewContent: UIView!{
        didSet{
            
            viewContent.layer.cornerRadius = 5
            mySwitch.isRounded = false
            mySwitch.onTintColor =  UIColor(red: 190.0/255, green: 28.0/255, blue: 0, alpha: 1.0)
            mySwitch.frame = positionSwitch
            mySwitch.addTarget(self, action: "switchChanged:", forControlEvents: UIControlEvents.ValueChanged)
            
            self.viewContent.addSubview(mySwitch)
            
        }
    }
    
    func switchChanged(sender: SevenSwitch) {
        offerDeal = !offerDeal
        mySwitch.setOn(offerDeal, animated: true)
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
