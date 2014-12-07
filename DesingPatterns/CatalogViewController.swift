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
        
        ObjcppObj.objShowCam();

//        let a: MyIntObj = 3;
//        println(add(1, 3))
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    //为表视图单元格提供数据，该方法是必须实现的方法
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier : String = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let data = self.items[indexPath.row] as NSDictionary
        cell.textLabel.text = data["title"] as? String
        
//        var rowDict : NSDictionary = listVideos.objectAtIndex(row) as NSDictionary
//        let dataImg : NSData = NSData(contentsOfURL: NSURL(string : url))
//        cell.JieVideoSubTitle.text = rowDict.objectForKey("video_subTitle") as? String
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let className: String = (self.items[indexPath.row] as NSDictionary)["class"] as String
        
        if let theClass = NSClassFromString(className) as? UIViewController.Type {
            let controller = theClass(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }

}















