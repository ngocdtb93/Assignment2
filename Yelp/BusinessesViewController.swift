//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import Spring

class BusinessesViewController: UIViewController {

    @IBAction func btnFilter(sender: AnyObject) {
        let nextVC:UIViewController = storyboard?.instantiateViewControllerWithIdentifier("SettingViewController") as! SettingViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var businesses: [Business] = []
    var filteredTableData : [Business] = []
    var searchActive = false
    var needReload = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 117
        tableView.rowHeight = UITableViewAutomaticDimension
        loadData()
        
        //pull to refresh
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("refreshControlAction:"), forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
    }
        override func viewDidAppear(animated: Bool) {
            if(needReload){
                needReload = false
                tableView.reloadData()
            }
        
    }
    //MARK: - pull to refresh Data
    func refreshControlAction(refreshControl:UIRefreshControl){
        loadData()
        refreshControl.endRefreshing()
    }
    
    //MARK: - Load Data
    func loadData(){
        self.view.showLoading()
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.view.hideLoading()
            self.businesses = businesses
            self.tableView.reloadData()
            
        })
    }
    
}

extension BusinessesViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive){
            return filteredTableData.count
        }else{
            return businesses.count
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BusinessTableViewCell
        var business:Business!
        if(searchActive){
            business = filteredTableData[indexPath.row]
        }else{
            business = businesses[indexPath.row]
        }
        cell.business = business
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var business:Business!
        if(searchActive){
            business = filteredTableData[indexPath.row]
        }else{
            business = businesses[indexPath.row]
        }
        let nextVc = storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        nextVc.business = business
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
}
extension BusinessesViewController:UISearchBarDelegate{
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
        searchActive = false;
        searchBar.setShowsCancelButton(false, animated: true)
    }
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
        searchBar.text = ""
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchBar.text! != ""){
            self.filteredTableData = self.businesses.filter({( chosePost : Business) -> Bool in
                
                let title = chosePost.name
                let stringMatch = (title!.uppercaseString).rangeOfString(searchBar.text!.uppercaseString)
                return (stringMatch != nil)
            })
            self.tableView.reloadData()
        }else{
            searchActive = false
            self.searchBar.resignFirstResponder()
            self.tableView.reloadData()
            
        }
    }

}





