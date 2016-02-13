//
//  ViewController.swift
//  Yelp
//
//  Created by Andre Oriani on 2/10/16.
//  Copyright © 2016 Orion. All rights reserved.
//

import UIKit
import CoreLocation

class BusinessViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: BusinessDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        dataSource = BusinessDataSource(forTable: tableView)

        YelpService.sharedInstance.newRequest().searchTerm("american").execute({
            result in self.dataSource.items = result.businesses
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
