//
//  Date.swift
//  TaskIt
//
//  Created by jim Veneskey on 5/26/15.
//  Copyright (c) 2015 Jim Veneskey. All rights reserved.
//

import Foundation

class Date {
    
    class func from (#year:Int, month: Int, day: Int) -> NSDate {
        
        // Create an NSDate component
        var components = NSDateComponents()
        // Now, update the NSDate component 'components' with the aptly named parameters we were passed
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        var date = gregorianCalendar?.dateFromComponents(components)
        return date!
    }
    
    class func toString(#date:NSDate) -> String {
        
        let dateStringFormater = NSDateFormatter()
        dateStringFormater.dateFormat = "yyyy-MM-dd"
        
        let dateString = dateStringFormater.stringFromDate(date)
        
        return dateString
    }
    
}