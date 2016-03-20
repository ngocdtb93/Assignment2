//
//  DistanceTableViewCell.swift
//  Yelp
//
//  Created by Ngoc Do on 3/20/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

protocol DistanceDelegate{
    func showDistanceItem(controller:DistanceTableViewCell,show:Bool)
}

class DistanceTableViewCell: UITableViewCell {

    @IBOutlet weak var viewContent: UIView!{
        didSet{
            viewContent.layer.cornerRadius = 5
        }
    }

    var delegate:DistanceDelegate?
    var rowNumber:Int?{
        didSet{
            if(rowNumber == 0){
                btnShowMore.hidden = false
            }else{
                btnShowMore.hidden = true
            }
        }
    }
    var name:String?{
        didSet{
            lblName.text = name
        }
    }
    
    @IBOutlet weak var btnShowMore: UIButton!
    
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if( selected == true){
            if(rowNumber != 0 ){
                distanceList[0] = distanceList[rowNumber!]
                delegate?.showDistanceItem(self, show: false)
            }else{
                delegate?.showDistanceItem(self, show: true)
            }
        }
    }
}
