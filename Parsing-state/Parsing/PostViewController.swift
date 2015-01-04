//
//  PostViewController.swift
//  Clamor
//
//  Created by Neil Palleti on 1/2/15.
//  Copyright (c) 2015 Haxos. All rights reserved.
//


import UIKit

class PostViewController: UIViewController {
    var itemstr = "";
    var rating = 1;
    var ind = 0;
    //var model = ModelCool(locate: false);
    var voted = false;
    var white = UIColor.whiteColor()
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var detail: UITextView!
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (countElements(itemstr) > 10) {
            subject.text = itemstr.substringToIndex(advance(itemstr.startIndex, 9));
        }
        else {
            subject.text = itemstr;
        }
        detail.text = itemstr;
        
        //model = ModelCool(locate: true);
        score.text = "\(rating)";
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func upvote(sender: AnyObject) {
        if(voted){
            return;
        }
        print("upvote function:\(ind)");
        MyModel.model.like(ind);
        rating++;
        score.text = "\(rating)";
        score.textColor = white;
        voted = true;
    }
    @IBAction func downvote(sender: AnyObject) {
        if(voted){
            return;
        }
       MyModel.model.downvote(ind);
        rating--;
        score.text = "\(rating)";
        score.textColor = white;
        voted = true;
    }
    @IBAction func back(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true);
    }
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}