//
//  BusinessTableViewCell.swift
//  Yelp
//
//  Created by Ngoc Do on 3/15/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDistance: UILabel!
    
    @IBOutlet weak var imageStar: UIImageView!
    
    @IBOutlet weak var lblViewer: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblCategories: UILabel!
    
    var business:Business!{
        didSet{
            lblTitle.text = business.name
            lblDistance.text = business.distance
            lblViewer.text = "\(business.reviewCount!) Reviews"
            lblAddress.text = business.address
            lblCategories.text = business.categories
            avatar.setImageWithURL(business.imageURL!)
            imageStar.setImageWithURL(business.ratingImageURL!)
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 5
    }

    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        if(selected){
            lblTitle.textColor = UIColor.whiteColor()
        }else{
            lblTitle.textColor = UIColor.blackColor()
        }
        let bgView = UIView()
        
        bgView.backgroundColor = UIColor(red: 190.0/255, green: 28.0/255, blue: 0, alpha: 1.0)
        self.selectedBackgroundView = bgView
        
    }

}
