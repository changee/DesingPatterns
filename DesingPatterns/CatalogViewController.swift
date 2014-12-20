//
//  CatalogViewController.swift
//  DesingPatterns
//
//  Created by zhiquan on 14-12-7.
//  Copyright (c) 2014年 Chee. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var items:NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = NSBundle.mainBundle().pathForResource("CatalogData", ofType: "plist")
        items = NSArray(contentsOfFile: filePath!)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellIdentifier : String = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        let data = self.items[indexPath.row] as NSDictionary
        cell.textLabel.text = data["title"] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let classInfo : NSDictionary = (self.items[indexPath.row] as NSDictionary);
        let className: String = classInfo["class"] as String
        
        if let theClass = NSClassFromString(className) as? UIViewController.Type {
            let controller = theClass(nibName: nil, bundle: nil)
            controller.title = classInfo["title"] as? String
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }

}















