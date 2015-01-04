//
//  ViewController.swift
//
//  ViewController.swift
//  Clamour
//
//  Created by Rohan on 1/1/15.
//  Copyright (c) 2015 Haxos. All rights reserved.
//
extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
import UIKit
struct MyModel {
    static var model = ModelCool(locate: false);
}
class ViewController: UIViewController, UITextViewDelegate, UITableViewDelegate,  UITableViewDataSource {
   // var model = ModelCool(locate: false);
    @IBOutlet weak var tableView: UITableView!
    var items: [String] = [];
    var magentacg:CGColor =  UIColor(rgb: 0x9999ff).CGColor
    var magenta:UIColor = UIColor(rgb: 0x9999ff)
    var white = UIColor.whiteColor()
    var refreshControl:UIRefreshControl!
    var top = false;
    var clicked : Int = -1;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
        println(tableView);
        MyModel.model = ModelCool(locate: true);
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        println("how are you?");
        refresh(self);
    }
    func refresh(sender:AnyObject)
    {
        // Code to refresh table view
        MyModel.model.download();
        loadData(MyModel.model.contentList, rating: MyModel.model.ratingsList);
        
        self.refreshControl.endRefreshing()
    }
    
    func loadData(var content : Array<String>, var rating : Array<Int>){
        items = [];
        for (var i = 0; i < content.count; i++) {
            items.append(content[i] + ": \(rating[i])");
        }
        tableView.reloadData();
    }
    
    func textView(textView: UITextView!, shouldChangeTextInRange: NSRange, replacementText: NSString!) {
        if(replacementText == "\n") {
            textView.resignFirstResponder()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func topNewAction(sender: AnyObject) {
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // when someone clicks on a row
        clicked = indexPath.row;
        performSegueWithIdentifier("seePost", sender: self);
        clicked = -1;
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "seePost"){
            if(clicked == -1) {
                return;
            }
            var pc = (segue.destinationViewController as PostViewController);
            pc.itemstr = MyModel.model.contentList[clicked];
            pc.rating = MyModel.model.ratingsList[clicked];
            pc.ind = clicked;
        }
    }
    /*
    
    */
    //    optional func tableView( tableView: UITableView,
    //        willDisplayCell cell: UITableViewCell,
    //        forRowAtIndexPath indexPath: NSIndexPath)
}
