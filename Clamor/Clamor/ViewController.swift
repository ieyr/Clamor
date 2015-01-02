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

class ViewController: UIViewController, UITextViewDelegate, UITableViewDelegate,  UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var field: UITextView!
    var items: [String] = ["population : 0", "population: 1"];
    
    
    @IBOutlet weak var topTab: UIButton!
    @IBOutlet weak var newTab: UIButton!
    var magentacg:CGColor =  UIColor(rgb: 0x9999ff).CGColor
    var magenta:UIColor = UIColor(rgb: 0x9999ff)
    var white = UIColor.whiteColor()
    
    var top = false;
    var clicked : Int = -1;
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view, typically from a nib.

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
    @IBAction func newTabAction(sender: UIButton) {
        if(top){
            newTab.backgroundColor = magenta;
            newTab.setTitleColor(white,forState: UIControlState())
            topTab.backgroundColor = white
            topTab.setTitleColor(magenta, forState: UIControlState())
            top = false
        }
    }
    @IBAction func topTabAction(sender: UIButton) {
        if(!top){
            topTab.backgroundColor = magenta;
            topTab.setTitleColor(white,forState: UIControlState())
            newTab.backgroundColor = white
            newTab.setTitleColor(magenta, forState: UIControlState())
            top = true;
            
        }
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
            pc.itemstr = items[clicked];
 
        }
    }
    /*
   
    */
//    optional func tableView( tableView: UITableView,
//        willDisplayCell cell: UITableViewCell,
//        forRowAtIndexPath indexPath: NSIndexPath)
}

