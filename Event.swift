//
//  Event.swift
//  CS407-Homework2-CalendarApp
//
//  Created by James Payne on 10/24/15.
//  Copyright © 2015 James Payne. All rights reserved.
//

import Foundation

struct Event {
    var name = ""
    var start = NSDate()
    var end = NSDate()
    var description = ""
}

var calendar: [NSDate: [String: Event]] = [:]

protocol eventDelegate {
    func createEvent(event: Event, new: Bool)
}