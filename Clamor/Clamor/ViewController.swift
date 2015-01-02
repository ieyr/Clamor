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

class ViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var field: UITextView!
    
    
    @IBOutlet weak var topTab: UIButton!
    @IBOutlet weak var newTab: UIButton!
    var magentacg:CGColor =  UIColor(rgb: 0x9999ff).CGColor
    var magenta:UIColor = UIColor(rgb: 0x9999ff)
    var white = UIColor.whiteColor()
    
    var top = false;
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self;

        // Do any additional setup after loading the view, typically from a nib.

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
//    optional func tableView( tableView: UITableView,
//        willDisplayCell cell: UITableViewCell,
//        forRowAtIndexPath indexPath: NSIndexPath)
}

