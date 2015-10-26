//
//  DateTableViewController.swift
//  CS407-Homework2-CalendarApp
//
//  Created by James Payne on 10/25/15.
//  Copyright © 2015 James Payne. All rights reserved.
//

import UIKit

class DateTableViewController: UITableViewController, eventDelegate {

    var currentEvents: [Event] = []
    var currentDate: NSDate?
    
    func printCalendar() {
        for (curDate, events) in calendar {
            print("Date: \(curDate)")
            for (_, v) in events {
                print(v)
            }
        }
    }
    
    // MARK: Delegate functions
    func createEvent(event: Event, new: Bool) {
        if (calendar[currentDate!] == nil) {calendar[currentDate!] = [:]}
        if (new) {
            calendar[currentDate!]![event.name] = event
        }
        
        self.resetCurrentEvents()
        
        self.tableView.reloadData()
    }
    
    func resetCurrentEvents() {
//        printCalendar()
        if (calendar[currentDate!] != nil) {
            currentEvents = calendar[currentDate!]!.values.sort(byStart)
        }
        else {
            currentEvents = []
        }
    }
    
    // Sorting function
    func byStart(e1: Event, _ e2: Event) -> Bool {
        return !(e1.start.earlierDate(e2.start).isEqual(e2.start))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.resetCurrentEvents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentEvents.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "eventCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventTableViewCell

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        
        // Configure the cell...
        cell.nameLabel.text = currentEvents[indexPath.row].name
        cell.startLabel.text = dateFormatter.stringFromDate(currentEvents[indexPath.row].start)
        cell.endLabel.text = dateFormatter.stringFromDate(currentEvents[indexPath.row].end)

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let eventName = currentEvents[indexPath.row].name
            currentEvents.removeAtIndex(indexPath.row)
            calendar[currentDate!]![eventName] = nil
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destView = segue.destinationViewController as? EventViewController
        destView?.delegate = self
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let eventName = currentEvents[indexPath.row].name
            destView?.event = calendar[currentDate!]![eventName]
        }
    }

}
