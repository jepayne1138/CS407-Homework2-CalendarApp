//
//  EventViewController.swift
//  CS407-Homework2-CalendarApp
//
//  Created by James Payne on 10/25/15.
//  Copyright © 2015 James Payne. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    var event: Event?
    var delegate: eventDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (event != nil) {
            nameTextField.text = event!.name
            startDatePicker.date = event!.start
            endDatePicker.date = event!.end
            descriptionTextView.text = event!.description
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBarButtonItem(sender: UIBarButtonItem) {
        if (nameTextField.text == "")  {return}
        
        var newEvent = false
        
        if event == nil {
            event = Event()
            newEvent = true
        }
        event!.name = nameTextField.text!
        event!.start = startDatePicker.date
        event!.end = endDatePicker.date
        event!.description = descriptionTextView.text
        
        delegate?.createEvent(event!, new: newEvent)
        
        // Pop view controller
        self.navigationController?.popViewControllerAnimated(true)
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
