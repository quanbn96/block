//
//  ViewController.swift
//  Blocks
//
//  Created by Quan on 7/27/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var dictData: NSDictionary!
    var dataModel: NSMutableArray!
    var first: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let array = NSMutableArray()
        var filePath = NSBundle.mainBundle().pathForResource("Model", ofType: "plist")
        dictData = NSDictionary(contentsOfFile: filePath!)
        for item in dictData {
            let urlString = item.value.valueForKey("urlString") as! String
            let dataForModel = item.value.valueForKey("dataForModel")
            let model = Model(name: dataForModel?.valueForKey("name") as! String, height: dataForModel?.valueForKey("height") as! String, sode3vong: dataForModel?.valueForKey("sodo3vong") as! String, stringUrl: urlString)
            array.addObject(model)
            
            first.append(true)
        }
        self.dataModel = NSMutableArray(array: array)
        
        
    }
    
    func loadData(stringUrl: String, completion: (data: NSData)->()) {
        print("run")
        dispatch_async(dispatch_get_global_queue(0, 0), {
            if let url = NSURL(string: stringUrl) {
                if let data = NSData(contentsOfURL: url) {
                    completion(data: data)
                }
            }
        })
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomizeCell
        cell.kCellWidth = self.view.frame.size.width
        let dataM = dataModel[indexPath.row] as! Model
        cell.lbl_Name.text = dataM.name
        cell.lbl_Height.text = "Chiều cao: \(dataM.height!)"
        cell.lbl_Sodo3vong.text = "Số đo : \(dataM.sodo3vong!)"
        loadData(dataM.stringUrl!, completion: {(data: NSData) -> () in
            dispatch_async(dispatch_get_main_queue(), {
                cell.photoForModel.image = UIImage(data: data)
                
            })
        })
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    


}

