//
//  CalendarViewController.swift
//  CS407-Homework2-CalendarApp
//
//  Created by James Payne on 10/25/15.
//  Copyright © 2015 James Payne. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var currentDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destView = segue.destinationViewController as? DateTableViewController
        destView?.currentDate = currentDatePicker.date
    }

}
