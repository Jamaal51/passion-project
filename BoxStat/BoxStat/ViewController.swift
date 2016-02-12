//
//  ViewController.swift
//  BoxStat
//
//  Created by Jamaal Sedayao on 2/2/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var names = ["Bob", "Kelly", "Sara"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//MARK: - TableView 
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
      
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath:indexPath) as UITableViewCell
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
}

