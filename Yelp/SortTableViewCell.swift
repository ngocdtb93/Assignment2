//
//  SortTableViewCell.swift
//  Yelp
//
//  Created by Ngoc Do on 3/20/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

protocol SortDelegate{
    func showSortItem(controller:SortTableViewCell,show:Bool)
}

class SortTableViewCell: UITableViewCell {
    var delegate:SortDelegate?
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
    
    @IBOutlet weak var viewContent: UIView!{
        didSet{
            viewContent.layer.cornerRadius = 5
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
                sortList[0] = sortList[rowNumber!]
                delegate?.showSortItem(self, show: false)
            }else{
                delegate?.showSortItem(self, show: true)
            }
        }
    }

}
