//
//  ClamorViewController.swift
//  Parsing
//
//  Created by Rohan on 1/2/15.
//  Copyright (c) 2015 Haxors. All rights reserved.
//

import UIKit

class ClamorViewController: UIViewController {

    @IBOutlet weak var area: UITextView!
    var model = ModelCool(locate: false);
    override func viewDidLoad() {
        super.viewDidLoad()
        model = ModelCool(locate: true);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressed(sender: AnyObject) {
        model.upload(area.text, radius: 0.75);
        performSegueWithIdentifier("backtotable", sender: self);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
