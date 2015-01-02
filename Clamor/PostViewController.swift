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
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var detail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (countElements(itemstr) > 10) {
            subject.text = itemstr.substringToIndex(advance(itemstr.startIndex, 10));
        }
        else {
            subject.text = itemstr;
        }
        detail.text = itemstr;
        // Do any additional setup after loading the view.
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

}
