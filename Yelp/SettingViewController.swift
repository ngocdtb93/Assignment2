//
//  SettingViewController.swift
//  Yelp
//
//  Created by Ngoc Do on 3/19/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,SortDelegate, DistanceDelegate {
    
    //MARK: - Delegate
    func showSortItem(controller:SortTableViewCell,show:Bool){
        //reaload comment
        tableView.beginUpdates()
        if(show == true){
            numberRowOfSort = sortList.count
        }else{
             numberRowOfSort = 1
        }
        
        tableView.reloadSections(NSIndexSet(index: 2), withRowAnimation: UITableViewRowAnimation.Automatic)
        tableView.endUpdates()
        
    }
    func showDistanceItem(controller:DistanceTableViewCell,show:Bool){
        //reaload comment
        tableView.beginUpdates()
        if(show == true){
            numberRowOfDistance = distanceList.count
        }else{
            numberRowOfDistance = 1
        }
        
        tableView.reloadSections(NSIndexSet(index: 1), withRowAnimation: UITableViewRowAnimation.Automatic)
        tableView.endUpdates()
        
    }
    
    var numberRowOfSort = 1
    var numberRowOfDistance = 1
    var numberRowOfCategory = 3
    var indexSort:NSIndexPath = NSIndexPath(forRow: 0, inSection: 2)
    
    
    @IBAction func btnCancel(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func btnSearch(sender: AnyObject) {
        self.view.showLoading()
        //get list category
        var mode:YelpSortMode!
        var chosenCategories:[String] = []
        for cate in categoryList{
            if((cate["state"] as! Bool) == true){
                chosenCategories.append(cate["code"] as! String)
            }
        }
        //get sort by
        if(sortList[0] as! String == "Highest Rated"){
            mode = YelpSortMode.HighestRated
        }else if(sortList[0] as! String == "Best Matched"){
            mode = YelpSortMode.BestMatched
        }else if(sortList[0] as! String == "Distance"){
            mode = YelpSortMode.Distance
        }
        
        //get distance
        
        //get list view controller
        let vcList:[UIViewController] = (self.navigationController?.viewControllers)!
        
        Business.searchWithTerm("Thai", sort: mode, categories: chosenCategories, deals: offerDeal) { (result:[Business]!, err:NSError!) -> Void in
            //reload data
            
            for vc in vcList{
                if( vc.isKindOfClass(BusinessesViewController)){
                    self.view.hideLoading()
                    (vc as! BusinessesViewController).businesses = result
                    (vc as! BusinessesViewController).needReload = true
                        self.navigationController?.popViewControllerAnimated(true)
                }
            }
            
        }
        
    }
    @IBAction func btnShowAllCategories(sender: AnyObject) {
        numberRowOfCategory = categoryList.count
        tableView.beginUpdates()
        tableView.reloadSections(NSIndexSet(index: 3), withRowAnimation: UITableViewRowAnimation.Automatic)
        tableView.endUpdates()
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 61
        tableView.rowHeight = UITableViewAutomaticDimension
    }

}
extension SettingViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }else if(section == 1){
            return numberRowOfDistance
        }else if(section == 2){
            return numberRowOfSort
        }else if ( section == 3){
            return numberRowOfCategory
        }
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if( indexPath.section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier("DealCell", forIndexPath: indexPath) as! DealTableViewCell
            print(offerDeal)
            cell.mySwitch.setOn(offerDeal, animated: true)
            return cell
        }else if( indexPath.section == 1){
            let cell = tableView.dequeueReusableCellWithIdentifier("DistanceCell", forIndexPath: indexPath) as! DistanceTableViewCell
            cell.delegate = self
            cell.name = distanceList[indexPath.row] as? String
            cell.rowNumber = indexPath.row
            return cell
            
        }else if( indexPath.section == 2){
            let cell = tableView.dequeueReusableCellWithIdentifier("SortCell", forIndexPath: indexPath) as! SortTableViewCell
            cell.delegate = self
            cell.name = sortList[indexPath.row] as? String
            cell.rowNumber = indexPath.row
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath) as! CategoryTableViewCell
            cell.rowNumber = indexPath.row
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if( section == 1){
            return "Distance"
        }else if( section == 2){
            return "Sort by"
        }else if( section == 3){
            return "Categories"
        }else{
            return ""
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
}

