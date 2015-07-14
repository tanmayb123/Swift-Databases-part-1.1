//
//  ViewController.swift
//  DatabaseTest
//
//  Created by Tanmay Bakshi on 2014-09-02.
//  Copyright (c) 2014 TBSS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableview: UITableView!

    var data: NSArray = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        data = dataOfJson("http://www.kulchan.com/api/index.php?action=getUsers")["result"] as! NSArray
        print(data)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func reload() {
        data = dataOfJson("http://www.kulchan.com/api/index.php?action=getUsers")["result"] as! NSArray
        self.tableview.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func dataOfJson(url: String) -> NSDictionary {
        request = TBSDB(initWithURL: url)
        return request.dictionaryValue()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: additionInfoCell = self.tableview.dequeueReusableCellWithIdentifier("customCell") as! additionInfoCell
        var maindata = (data[indexPath.row] as! NSDictionary)
        cell.name!.text = maindata["name"] as! String
        var userID = maindata["id"] as! Int
        var age = maindata["age"] as! String
        var imageURL = maindata["image"] as! String
        var image = UIImage(data: NSData(contentsOfURL: NSURL(string: imageURL)!)!)
        cell.imageview!.image = image
        cell.info!.text = "id: \(userID)\nage: \(age)"
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    }
