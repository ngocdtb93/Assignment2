//
//  Constant.swift
//  Yelp
//
//  Created by Ngoc Do on 3/20/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import Foundation
import UIKit

let storyboard = UIStoryboard(name: "Main", bundle: nil)
let positionSwitch = CGRectMake(width - 72, 12 , 50, 25)

let width = UIScreen.mainScreen().bounds.width
var sortList:NSMutableArray = ["Auto", "Highest Rated", "Best Matched", "Distance"]
var distanceList:NSMutableArray = ["Auto", "0.3 Miles", "1 Miles", "5 Miles", "20 Miles"]
var offerDeal:Bool = false

let categoryList:[NSMutableDictionary] = [["name" : "Afghan", "code": "afghani","state":false],
    ["name" : "African", "code": "african","state":false],
    ["name" : "American, New", "code": "newamerican","state":false],
    ["name" : "American, Traditional", "code": "tradamerican","state":false],
    ["name" : "Arabian", "code": "arabian","state":false],
    ["name" : "Argentine", "code": "argentine","state":false],
    ["name" : "Armenian", "code": "armenian","state":false],
    ["name" : "Asian Fusion", "code": "asianfusion","state":false],
    ["name" : "Asturian", "code": "asturian","state":false],
    ["name" : "Australian", "code": "australian","state":false],
    ["name" : "Austrian", "code": "austrian","state":false],
    ["name" : "Baguettes", "code": "baguettes","state":false],
    ["name" : "Bangladeshi", "code": "bangladeshi","state":false],
    ["name" : "Barbeque", "code": "bbq","state":false],
    ["name" : "Basque", "code": "basque","state":false],
    ["name" : "Bavarian", "code": "bavarian","state":false],
    ["name" : "Beer Garden", "code": "beergarden","state":false],
    ["name" : "Beer Hall", "code": "beerhall","state":false],
    ["name" : "Beisl", "code": "beisl","state":false],
    ["name" : "Belgian", "code": "belgian","state":false],
    ["name" : "Bistros", "code": "bistros","state":false],
    ["name" : "Black Sea", "code": "blacksea","state":false],
    ["name" : "Brasseries", "code": "brasseries","state":false],
    ["name" : "Brazilian", "code": "brazilian","state":false],
    ["name" : "Breakfast & Brunch", "code": "breakfast_brunch","state":false],
    ["name" : "British", "code": "british","state":false],
    ["name" : "Buffets", "code": "buffets","state":false],
    ["name" : "Bulgarian", "code": "bulgarian","state":false],
    ["name" : "Burgers", "code": "burgers","state":false],
    ["name" : "Canadian", "code": "New)","state":false],
    ["name" : "Canteen", "code": "canteen","state":false],
    ["name" : "Caribbean", "code": "caribbean","state":false],
    ["name" : "Catalan", "code": "catalan","state":false],
    ["name" : "Chech", "code": "chech","state":false],
    ["name" : "Ethiopian", "code": "ethiopian","state":false],
    ["name" : "French", "code": "french","state":false],
    ["name" : "French Southwest", "code": "sud_ouest","state":false],
    ["name" : "Galician", "code": "galician","state":false],
    ["name" : "Gastropubs", "code": "gastropubs","state":false],
    ["name" : "Georgian", "code": "georgian","state":false]]

