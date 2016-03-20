//
//  CategoryTableViewCell.swift
//  Yelp
//
//  Created by Ngoc Do on 3/18/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import SevenSwitch

class CategoryTableViewCell: UITableViewCell {

    let mySwitch = SevenSwitch()
    
    @IBOutlet weak var viewContent: UIView!{
        didSet{
            viewContent.layer.cornerRadius = 5
            viewContent.layer.cornerRadius = 5
            mySwitch.isRounded = false
            mySwitch.onTintColor =  UIColor(red: 190.0/255, green: 28.0/255, blue: 0, alpha: 1.0)
            mySwitch.frame = positionSwitch
            mySwitch.addTarget(self, action: "switchChanged:", forControlEvents: UIControlEvents.ValueChanged)
            
            self.viewContent.addSubview(mySwitch)
        }
    }
    
    func switchChanged(sender: SevenSwitch) {
        var flag = (categoryList[rowNumber!]["state"] as? Bool)!
        flag = !flag
        
        categoryList[rowNumber!]["state"] = flag
        mySwitch.setOn(flag, animated: true)
    }
    
    
    var rowNumber:Int?{
        didSet{
            let flag = (categoryList[rowNumber!]["state"] as? Bool)
            lblName.text = categoryList[rowNumber!]["name"] as? String
            mySwitch.setOn(flag!, animated: true)
        }
    }

    @IBOutlet weak var lblName: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
