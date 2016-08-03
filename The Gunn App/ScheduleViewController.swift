//
//  ScheduleViewController.swift
//  The Gunn App
//
//  Created by Xavi Loinaz on 6/5/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import UIKit
import Foundation

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var scheduleTable: UITableView!
    @IBOutlet weak var dayAndDate: UILabel!
    @IBOutlet weak var minutesRemaining: UILabel!
    @IBOutlet weak var timeProgressBar: UIProgressView!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    
    var alternateScheduleDates : [String] = []
    var scheduleForCurrentDay : [Period] = []
    var whichSegControl : Int = 0
    

    @IBAction func updateInfo(sender: AnyObject) {
        viewDidLoad()
    }
    
    @IBOutlet weak var distanceToTableShort: NSLayoutConstraint!
    
    @IBOutlet weak var distanceToTableLong: NSLayoutConstraint!
    
    @IBOutlet weak var dayAndDateToProgBar: NSLayoutConstraint!
    
    
    
    @IBAction func switchSegments(sender: AnyObject) {
        var accessed0 = false
        var accessed1 = false
        var accessed2 = false
/*        let modConstraint01 = NSLayoutConstraint(item: self.scheduleTable,
                                                 attribute: .Top,
                                                 relatedBy: .Equal,
                                                 toItem: self.minutesRemaining,
                                                 attribute: .Bottom,
                                                 multiplier: 1.0,
                                                 constant: 6.0)
        let modConstraint02 = NSLayoutConstraint(item: self.dayAndDate,
                                                 attribute: .Top,
                                                 relatedBy: .Equal,
                                                 toItem: self.segmentedController,
                                                 attribute: .Bottom,
                                                 multiplier: 1.0,
                                                 constant: 7.0)

/*        let modConstraint11 = NSLayoutConstraint(item: self.dayAndDate,
                                                 attribute: .Top,
                                                 relatedBy: .Equal,
                                                 toItem: self.segmentedController,
                                                 attribute: .Bottom,
                                                 multiplier: 1.0,
                                                 constant: 7.0)
*/        let modConstraint12 = NSLayoutConstraint(item: self.scheduleTable,
                                                 attribute: .Top,
                                                 relatedBy: .Equal,
                                                 toItem: self.dayAndDate,
                                                 attribute: .Bottom,
                                                 multiplier: 1.0,
                                                 constant: 6.0)
        let modConstraint2 = NSLayoutConstraint(item: scheduleTable,
                                                attribute: .Top,
                                                relatedBy: .Equal,
                                                toItem: self.segmentedController,
                                                attribute: .Bottom,
                                                multiplier: 1.0,
                                                constant: 4.0)
*/
 
        if segmentedController.selectedSegmentIndex == 0 {
            whichSegControl = 0
            scheduleForCurrentDay.removeAll()
            viewDidLoad()
            scheduleTable.reloadData()
            minutesRemaining.hidden = false
            timeProgressBar.hidden = false
            dayAndDate.hidden = false
            distanceToTableLong.priority = 999
            distanceToTableShort.priority = 999
            distanceToTableLong.constant = 68
            distanceToTableShort.constant = 43
            //dayAndDateToProgBar.priority = 999
/*            var theModConstraint01 = NSLayoutConstraint()
            var theModConstraint02 = NSLayoutConstraint()
            if accessed0 {
                theModConstraint01.priority = 999
                theModConstraint02.priority = 999
            } else {
                theModConstraint01 = modConstraint01
                theModConstraint02 = modConstraint02
                self.view.addConstraint(theModConstraint01)
                self.view.addConstraint(theModConstraint02)
            }
            if accessed1 {
                // modConstraint11.priority = 1
                modConstraint12.priority = 1
            }
            if accessed2 {
                modConstraint2.priority = 1
            }
            accessed0 = true
*/
        }
        if segmentedController.selectedSegmentIndex == 1 {
            whichSegControl = 1
            scheduleForCurrentDay.removeAll()
            viewDidLoad()
            scheduleTable.reloadData()
            minutesRemaining.hidden = true
            timeProgressBar.hidden = true
            dayAndDate.hidden = false
            distanceToTableLong.priority = 1
            distanceToTableShort.priority = 999
            distanceToTableShort.constant = 6
            //dayAndDateToProgBar.priority = 750
/*            if accessed1 {
                modConstraint02.priority = 999
                modConstraint12.priority = 999
                
            } else {
                //self.view.addConstraint(modConstraint11)
                self.view.addConstraint(modConstraint12)
            }
            if accessed0 {
                modConstraint01.priority = 1
                modConstraint02.priority = 1
            }
            if accessed2 {
                modConstraint2.priority = 1
            }
            accessed1 = true
*/
        }
        if segmentedController.selectedSegmentIndex == 2 {
            whichSegControl = 2
            scheduleForCurrentDay.removeAll()
            scheduleForCurrentDay.append(Period(name: "Monday Regular Schedule", startTime: " ", endTime: " "))
            scheduleForCurrentDay.append(Period(name: "A", startTime: "8:25", endTime: "9:45"))
            scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:45", endTime: "10:00"))
            scheduleForCurrentDay.append(Period(name: "B", startTime: "10:00", endTime: "11:15"))
            scheduleForCurrentDay.append(Period(name: "C", startTime: "11:25", endTime: "12:40"))
            scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:40", endTime: "1:20"))
            scheduleForCurrentDay.append(Period(name: "F", startTime: "1:20", endTime: "2:35"))
            scheduleForCurrentDay.append(Period(name: "Tuesday Regular Schedule", startTime: " ", endTime: " "))
            scheduleForCurrentDay.append(Period(name: "D", startTime: "8:25", endTime: "9:45"))
            scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:45", endTime: "10:00"))
            scheduleForCurrentDay.append(Period(name: "FlexTime", startTime: "10:00", endTime: "10:50"))
            scheduleForCurrentDay.append(Period(name: "E", startTime: "11:00", endTime: "12:15"))
            scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:15", endTime: "12:55"))
            scheduleForCurrentDay.append(Period(name: "A", startTime: "12:55", endTime: "2:15"))
            scheduleForCurrentDay.append(Period(name: "G", startTime: "2:25", endTime: "3:40"))
            scheduleForCurrentDay.append(Period(name: "Wednesday Regular Schedule", startTime: " ", endTime: " "))
            scheduleForCurrentDay.append(Period(name: "B", startTime: "8:25", endTime: "9:50"))
            scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:50", endTime: "10:05"))
            scheduleForCurrentDay.append(Period(name: "C", startTime: "10:05", endTime: "11:25"))
            scheduleForCurrentDay.append(Period(name: "D", startTime: "11:35", endTime: "12:55"))
            scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:55", endTime: "1:35"))
            scheduleForCurrentDay.append(Period(name: "F", startTime: "1:35", endTime: "2:55"))
            scheduleForCurrentDay.append(Period(name: "Thursday Regular Schedule", startTime: " ", endTime: " "))
            scheduleForCurrentDay.append(Period(name: "E", startTime: "8:25", endTime: "9:50"))
            scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:50", endTime: "10:05"))
            scheduleForCurrentDay.append(Period(name: "A", startTime: "10:05", endTime: "11:15"))
            scheduleForCurrentDay.append(Period(name: "B", startTime: "11:25", endTime: "12:35"))
            scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:35", endTime: "1:15"))
            scheduleForCurrentDay.append(Period(name: "G", startTime: "1:15", endTime: "2:35"))
            scheduleForCurrentDay.append(Period(name: "Tutorial", startTime: "2:45", endTime: "3:35"))
            scheduleForCurrentDay.append(Period(name: "Friday Regular Schedule", startTime: " ", endTime: " "))
            scheduleForCurrentDay.append(Period(name: "C", startTime: "8:25", endTime: "9:40"))
            scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:40", endTime: "9:55"))
            scheduleForCurrentDay.append(Period(name: "D", startTime: "9:55", endTime: "11:05"))
            scheduleForCurrentDay.append(Period(name: "E", startTime: "11:15", endTime: "12:25"))
            scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:25", endTime: "1:05"))
            scheduleForCurrentDay.append(Period(name: "F", startTime: "1:05", endTime: "2:15"))
            scheduleForCurrentDay.append(Period(name: "G", startTime: "2:25", endTime: "3:35"))
            
            scheduleTable.reloadData()
            minutesRemaining.hidden = true
            timeProgressBar.hidden = true
            dayAndDate.hidden = true
            distanceToTableLong.priority = 999
            distanceToTableShort.priority = 1
            distanceToTableLong.constant = 4
            //dayAndDateToProgBar.priority = 750
/*            if accessed2 {
                modConstraint2.priority = 999
            } else {
                self.view.addConstraint(modConstraint2)
            }
            if accessed0 {
                modConstraint01.priority = 1
                modConstraint02.priority = 1
            }
            if accessed1 {
                //modConstraint11.priority = 1
                modConstraint12.priority = 1
            }
            accessed2 = true
*/
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        var specialColor = UIColor(red: 213.0/255.0, green: 21.0/255.0, blue: 21.0/255.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = specialColor
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scheduleTable.delegate = self
        scheduleTable.dataSource = self
        let json = DownloadJSON()
        let events = json.downloadAndParseJSON()
        for i in 0...events.count-1 {
            if let summary = events[i].getSummary() {
                if summary.lowercaseString.rangeOfString("schedule") != nil &&  summary.lowercaseString.rangeOfString("below") != nil && summary.lowercaseString.rangeOfString("back") == nil && summary.lowercaseString.rangeOfString("school") == nil && summary.lowercaseString.rangeOfString("night") == nil {
                    alternateScheduleDates.append(events[i].getStartDate()!)
                    
                }
            }
        }
        
        if (whichSegControl == 0) {
            
            let date = NSDate()
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day , .Month , .Year, .Hour , .Minute], fromDate: date)
            
            
            let year = components.year
            let month = components.month
            let day = components.day
            let hour = components.hour
            let minute = components.minute
            
            var alternateScheduleDay = false
            
            var todayDate : String = String(year) + "-" + String(month) + "-" + String(day)
            
            if month < 10 && day < 10 {
                todayDate = String(year) + "-0" + String(month) + "-0" + String(day)
            } else if month < 10 {
                todayDate = String(year) + "-0" + String(month) + "-" + String(day)
            } else if day < 10 {
                todayDate = String(year) + "-" + String(month) + "-0" + String(day)
            }
            
            var theAltScheduleEvent : Event = Event()
            
            for x in 0...events.count-1 {
                for altDate in alternateScheduleDates {
                    if events[x].getStartDate() == todayDate && events[x].getStartDate() == altDate && events[x].getSummary()!.lowercaseString.rangeOfString("schedule") != nil &&  events[x].getSummary()!.lowercaseString.rangeOfString("below") != nil{
                        alternateScheduleDay = true
                        theAltScheduleEvent = events[x]
                        print(theAltScheduleEvent.getStartDate())
                        print(theAltScheduleEvent.getSummary())
                        //break
                    }
                }
                //break
            }
            
            
            var holiday = false
            
            for e in events {
                if e.getStartDate() == todayDate {
                    if e.getSummary()!.rangeOfString("HOLIDAY") != nil || e.getSummary()!.rangeOfString("WINTER BREAK") != nil || e.getSummary()!.rangeOfString("STAFF DEVELOPMENT DAY") != nil || e.getSummary()!.rangeOfString("SPRING BREAK") != nil || e.getSummary()!.lowercaseString.rangeOfString("teacher work day") != nil {
                        holiday = true
                    }
                }
            }

            
            if (month == 6 && day > 2) || (month == 7) || (month == 8 && day < 15) || holiday { // The code below is for summer and holidays
                
                dayAndDate.text = String(getDayOfWeek(todayDate)!) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(No School!)"
                minutesRemaining.text = "School's out!"
                timeProgressBar.setProgress(0, animated: false)
                
                adjustTextSize(dayAndDate)
                
                
                
            } else if alternateScheduleDay { // The code below is for alternate schedules
                
                let scheduleRawString = theAltScheduleEvent.getDescription()

                var arrayOfPeriodStrings = scheduleRawString!.componentsSeparatedByString("\n")
                
                var listOfPeriodsForDay : [String] = []
                var listOfStartTimesForDay : [String] = []
                var listOfEndTimesForDay : [String] = []
                for b in arrayOfPeriodStrings {
                    if !(b.isEmpty){
                        
                        // Gets array of periods for the day's schedule
                        let endIndex = Int(String(b.characters.indexOf("(")!))! - 2
                        var periodSubstring = b[0...endIndex]
                        if periodSubstring.lowercaseString.rangeOfString("period") != nil && 9 >= periodSubstring.characters.count && periodSubstring.characters.count >= 8 {
                            periodSubstring = periodSubstring[endIndex]
                        }
                        if periodSubstring.lowercaseString.rangeOfString("staff") == nil && periodSubstring.lowercaseString.rangeOfString("dept") == nil {
                            listOfPeriodsForDay.append(periodSubstring)
                        }
                        //print(periodSubstring)
                        
                        // Gets array of period start times for the day's schedule
                        let startIndex2 = Int(String(b.characters.indexOf("(")!))! + 1
                        let endIndex2 = Int(String(b.characters.indexOf("-")!))!
                        let periodStartTimeSubstring = b[startIndex2...endIndex2-1]
                        listOfStartTimesForDay.append(periodStartTimeSubstring)
                        
                        // Gets array of period end times for the day's schedule
                        let startIndex3 = Int(String(b.characters.indexOf("-")!))! + 1
                        let endIndex3 = Int(String(b.characters.indexOf(")")!))!
                        let periodEndTimeSubstring = b[startIndex3...endIndex3-1]
                        listOfEndTimesForDay.append(periodEndTimeSubstring)
                    }
                }
                if !listOfPeriodsForDay.isEmpty {
                    for c in 0...listOfPeriodsForDay.count-1 {
                        scheduleForCurrentDay.append(Period(name: listOfPeriodsForDay[c], startTime: listOfStartTimesForDay[c], endTime: listOfEndTimesForDay[c]))
                    }
                } else {
                    dayAndDate.text = String(getDayOfWeek(todayDate)!) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(No School!)"
                }
                
                
                if let dayOfWeek = getDayOfWeek(todayDate){
                    
                    if dayOfWeek != "Monday" && dayOfWeek != "Tuesday" && dayOfWeek != "Wednesday" && dayOfWeek != "Thursday" && dayOfWeek != "Friday" {
                        dayAndDate.text = String(dayOfWeek) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(No School!)"
                    }
                    
                    let displayedText = String(dayOfWeek) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(Alternate Schedule)"
                    
                    
                    dayAndDate.text = displayedText
                    
                    if displayedText.characters.count <= 38 {
                        dayAndDate.font = UIFont.systemFontOfSize(17)
                    } else if displayedText.characters.count <= 40 {
                        dayAndDate.font = UIFont.systemFontOfSize(16)
                    } else if displayedText.characters.count <= 42 {
                        dayAndDate.font = UIFont.systemFontOfSize(15)
                    } else if displayedText.characters.count <= 45 {
                        dayAndDate.font = UIFont.systemFontOfSize(14)
                    } else if displayedText.characters.count <= 47 {
                        dayAndDate.font = UIFont.systemFontOfSize(13)
                    } else if displayedText.characters.count <= 50 {
                        dayAndDate.font = UIFont.systemFontOfSize(12)
                    } else {
                        dayAndDate.font = UIFont.systemFontOfSize(11)
                    }
                    
                    
                    
                    
                }
                
            } else { // the code below is for regular schedules
                if var dayOfWeek = getDayOfWeek(todayDate) {
                    
                    var displayedText = String(dayOfWeek) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(Regular Schedule)"
                    
                    dayAndDate.text = displayedText
                    
                    if displayedText.characters.count <= 38 {
                        dayAndDate.font = UIFont.systemFontOfSize(17)
                    } else if displayedText.characters.count <= 40 {
                        dayAndDate.font = UIFont.systemFontOfSize(16)
                    } else if displayedText.characters.count <= 42 {
                        dayAndDate.font = UIFont.systemFontOfSize(15)
                    } else if displayedText.characters.count <= 45 {
                        dayAndDate.font = UIFont.systemFontOfSize(14)
                    } else if displayedText.characters.count <= 47 {
                        dayAndDate.font = UIFont.systemFontOfSize(13)
                    } else if displayedText.characters.count <= 50 {
                        dayAndDate.font = UIFont.systemFontOfSize(12)
                    } else {
                        dayAndDate.font = UIFont.systemFontOfSize(11)
                    }
                    
                    
                    if dayOfWeek == "Monday" {
                        scheduleForCurrentDay.append(Period(name: "A", startTime: "8:25", endTime: "9:45"))
                        scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:45", endTime: "10:00"))
                        scheduleForCurrentDay.append(Period(name: "B", startTime: "10:00", endTime: "11:15"))
                        scheduleForCurrentDay.append(Period(name: "C", startTime: "11:25", endTime: "12:40"))
                        scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:40", endTime: "1:20"))
                        scheduleForCurrentDay.append(Period(name: "F", startTime: "1:20", endTime: "2:35"))
                        
                        
                    } else if dayOfWeek == "Tuesday" {
                        scheduleForCurrentDay.append(Period(name: "D", startTime: "8:25", endTime: "9:45"))
                        scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:45", endTime: "10:00"))
                        scheduleForCurrentDay.append(Period(name: "FlexTime", startTime: "10:00", endTime: "10:50"))
                        scheduleForCurrentDay.append(Period(name: "E", startTime: "11:00", endTime: "12:15"))
                        scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:15", endTime: "12:55"))
                        scheduleForCurrentDay.append(Period(name: "A", startTime: "12:55", endTime: "2:15"))
                        scheduleForCurrentDay.append(Period(name: "G", startTime: "2:25", endTime: "3:40"))
                        
                        
                    } else if dayOfWeek == "Wednesday" {
                        scheduleForCurrentDay.append(Period(name: "B", startTime: "8:25", endTime: "9:50"))
                        scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:50", endTime: "10:05"))
                        scheduleForCurrentDay.append(Period(name: "C", startTime: "10:05", endTime: "11:25"))
                        scheduleForCurrentDay.append(Period(name: "D", startTime: "11:35", endTime: "12:55"))
                        scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:55", endTime: "1:35"))
                        scheduleForCurrentDay.append(Period(name: "F", startTime: "1:35", endTime: "2:55"))
                        
                    } else if dayOfWeek == "Thursday" {
                        scheduleForCurrentDay.append(Period(name: "E", startTime: "8:25", endTime: "9:50"))
                        scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:50", endTime: "10:05"))
                        scheduleForCurrentDay.append(Period(name: "A", startTime: "10:05", endTime: "11:15"))
                        scheduleForCurrentDay.append(Period(name: "B", startTime: "11:25", endTime: "12:35"))
                        scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:35", endTime: "1:15"))
                        scheduleForCurrentDay.append(Period(name: "G", startTime: "1:15", endTime: "2:35"))
                        scheduleForCurrentDay.append(Period(name: "Tutorial", startTime: "2:45", endTime: "3:35"))
                        
                    } else if dayOfWeek == "Friday" {
                        scheduleForCurrentDay.append(Period(name: "C", startTime: "8:25", endTime: "9:40"))
                        scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:40", endTime: "9:55"))
                        scheduleForCurrentDay.append(Period(name: "D", startTime: "9:55", endTime: "11:05"))
                        scheduleForCurrentDay.append(Period(name: "E", startTime: "11:15", endTime: "12:25"))
                        scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:25", endTime: "1:05"))
                        scheduleForCurrentDay.append(Period(name: "F", startTime: "1:05", endTime: "2:15"))
                        scheduleForCurrentDay.append(Period(name: "G", startTime: "2:25", endTime: "3:35"))
                        
                    } else {
                        displayedText = String(dayOfWeek) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(No School!)"
                        dayAndDate.text = displayedText
                        if displayedText.characters.count <= 38 {
                            dayAndDate.font = UIFont.systemFontOfSize(17)
                        } else if displayedText.characters.count <= 40 {
                            dayAndDate.font = UIFont.systemFontOfSize(16)
                        } else if displayedText.characters.count <= 42 {
                            dayAndDate.font = UIFont.systemFontOfSize(15)
                        } else if displayedText.characters.count <= 45 {
                            dayAndDate.font = UIFont.systemFontOfSize(14)
                        } else if displayedText.characters.count <= 47 {
                            dayAndDate.font = UIFont.systemFontOfSize(13)
                        } else if displayedText.characters.count <= 50 {
                            dayAndDate.font = UIFont.systemFontOfSize(12)
                        } else {
                            dayAndDate.font = UIFont.systemFontOfSize(11)
                        }
                    }
                    
                    
                }
            }
            
            
            if scheduleForCurrentDay.isEmpty {
                minutesRemaining.text = "School's out!"
            }
            
            
            var minutesPassedInDay = Int(hour * 60 + minute)
            var timeUntilPeriod = false
            var minutesUntil = 0
            var whichPeriod = ""
            var progressBarValue : Float = 0
            var counter = -1
            
            for y in scheduleForCurrentDay {
                counter += 1
                var hoursAndMinutesStart = y.getStartTime().componentsSeparatedByString(":")
                var theHoursStart : Int = Int(hoursAndMinutesStart[0])!
                if Int(theHoursStart) > 7 {
                    theHoursStart = Int(hoursAndMinutesStart[0])!
                } else {
                    theHoursStart = Int(hoursAndMinutesStart[0])! + 12
                }
                var theMinutesStart = hoursAndMinutesStart[1]
                var minutesForTimeStart = theHoursStart * 60 + Int(theMinutesStart)!
                
                if minutesPassedInDay < minutesForTimeStart {
                    minutesUntil = minutesForTimeStart - minutesPassedInDay
                    timeUntilPeriod = true
                    if y.getName().characters.count == 1 {
                        whichPeriod = "\(y.getName()) period starts"
                    } else {
                        whichPeriod = "\(y.getName()) starts"
                    }
                    if counter > 0 {
                        var hoursAndMinutesEndPrev = scheduleForCurrentDay[counter-1].getEndTime().componentsSeparatedByString(":")
                        var theHoursEndPrev = hoursAndMinutesEndPrev[0]
                        var theMinutesEndPrev = hoursAndMinutesEndPrev[1]
                        var minutesForTimeEndPrev = Int(theHoursEndPrev)! * 60 + Int(theMinutesEndPrev)!
                        var lengthOfGap = Float(minutesForTimeStart - minutesForTimeEndPrev)
                        var timePassedInGap = Float(minutesPassedInDay - minutesForTimeEndPrev)
                        progressBarValue = timePassedInGap / lengthOfGap
                    }
                    break
                }
                
                var hoursAndMinutesEnd = y.getEndTime().componentsSeparatedByString(":")
                var theHoursEnd : Int = Int(hoursAndMinutesEnd[0])!
                if Int(theHoursEnd) > 7 {
                    theHoursEnd = Int(hoursAndMinutesEnd[0])!
                } else {
                    theHoursEnd = Int(hoursAndMinutesEnd[0])! + 12
                }
                var theMinutesEnd = hoursAndMinutesEnd[1]
                var minutesForTimeEnd = theHoursEnd * 60 + Int(theMinutesEnd)!
                
                if minutesPassedInDay < minutesForTimeEnd {
                    minutesUntil = minutesForTimeEnd - minutesPassedInDay
                    timeUntilPeriod = true
                    if y.getName().characters.count == 1 {
                        whichPeriod = "\(y.getName()) period ends"
                    } else {
                        whichPeriod = "\(y.getName()) ends"
                    }
                    var lengthOfPeriod = Float(minutesForTimeEnd - minutesForTimeStart)
                    var progressThroughPeriod  = Float(minutesPassedInDay - minutesForTimeStart)
                    progressBarValue = progressThroughPeriod / lengthOfPeriod
                    break
                }
                
            }
            
            if timeUntilPeriod {
                minutesRemaining.text = "\(minutesUntil) minutes remaining until \(whichPeriod)"
            } else {
                minutesRemaining.text = "School's out!"
                
            }
            
            if minutesRemaining.text!.characters.count > 54 {
                minutesRemaining.font = UIFont.systemFontOfSize(10)
            }
            
            timeProgressBar.setProgress(progressBarValue, animated: false)
            
            
            
            
            
            
            
            
            
            
        } else if (whichSegControl == 1) {
            let calendar = NSCalendar.currentCalendar()
            let date = NSDate()
            let tomorrow = calendar.dateByAddingUnit(.Day, value: 1, toDate: NSDate(), options: [])
            let components = calendar.components([.Day , .Month , .Year, .Hour , .Minute], fromDate: tomorrow!)
            
            
            let year = components.year
            let month = components.month
            let day = components.day
            let hour = components.hour
            let minute = components.minute
            
            
            var alternateScheduleDay = false
            
            var todayDate : String = String(year) + "-" + String(month) + "-" + String(day)
            
            if month < 10 && day < 10 {
                todayDate = String(year) + "-0" + String(month) + "-0" + String(day)
            } else if month < 10 {
                todayDate = String(year) + "-0" + String(month) + "-" + String(day)
            } else if day < 10 {
                todayDate = String(year) + "-" + String(month) + "-0" + String(day)
            }
            
            var theAltScheduleEvent : Event = Event()
            
            for x in 0...events.count-1 {
                for altDate in alternateScheduleDates {
                    if events[x].getStartDate() == todayDate && events[x].getStartDate() == altDate && events[x].getSummary()!.lowercaseString.rangeOfString("schedule") != nil &&  events[x].getSummary()!.lowercaseString.rangeOfString("below") != nil{
                        alternateScheduleDay = true
                        theAltScheduleEvent = events[x]
                        print(theAltScheduleEvent.getStartDate())
                        print(theAltScheduleEvent.getSummary())
                        //break
                    }
                }
                //break
            }
            
            
            
            
            var holiday = false
            
            for e in events {
                if e.getStartDate() == todayDate {
                    if e.getSummary()!.rangeOfString("HOLIDAY") != nil || e.getSummary()!.rangeOfString("WINTER BREAK") != nil || e.getSummary()!.rangeOfString("STAFF DEVELOPMENT DAY") != nil || e.getSummary()!.rangeOfString("SPRING BREAK") != nil || e.getSummary()!.lowercaseString.rangeOfString("teacher work day") != nil {
                        holiday = true
                    }
                }
            }
            
            
            if (month == 6 && day > 2) || (month == 7) || (month == 8 && day < 15) || holiday { // The code below is for summer and holidays
                
                dayAndDate.text = String(getDayOfWeek(todayDate)!) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(No School!)"
                minutesRemaining.text = "School's out!"
                timeProgressBar.setProgress(0, animated: false)
                
                adjustTextSize(dayAndDate)
                
            } else if alternateScheduleDay { // The code below is for alternate schedules
                
                let scheduleRawString = theAltScheduleEvent.getDescription()

                var arrayOfPeriodStrings = scheduleRawString!.componentsSeparatedByString("\n")
                
                var listOfPeriodsForDay : [String] = []
                var listOfStartTimesForDay : [String] = []
                var listOfEndTimesForDay : [String] = []
                for b in arrayOfPeriodStrings {
                    if !(b.isEmpty){
                        
                        // Gets array of periods for the day's schedule
                        let endIndex = Int(String(b.characters.indexOf("(")!))! - 2
                        var periodSubstring = b[0...endIndex]
                        if periodSubstring.lowercaseString.rangeOfString("period") != nil && 9 >= periodSubstring.characters.count && periodSubstring.characters.count >= 8 {
                            periodSubstring = periodSubstring[endIndex]
                        }
                        if periodSubstring.lowercaseString.rangeOfString("staff") == nil && periodSubstring.lowercaseString.rangeOfString("dept") == nil {
                            listOfPeriodsForDay.append(periodSubstring)
                        }
                        
                        // Gets array of period start times for the day's schedule
                        let startIndex2 = Int(String(b.characters.indexOf("(")!))! + 1
                        let endIndex2 = Int(String(b.characters.indexOf("-")!))!
                        let periodStartTimeSubstring = b[startIndex2...endIndex2-1]
                        listOfStartTimesForDay.append(periodStartTimeSubstring)
                        
                        // Gets array of period end times for the day's schedule
                        let startIndex3 = Int(String(b.characters.indexOf("-")!))! + 1
                        let endIndex3 = Int(String(b.characters.indexOf(")")!))!
                        let periodEndTimeSubstring = b[startIndex3...endIndex3-1]
                        listOfEndTimesForDay.append(periodEndTimeSubstring)
                    }
                }
                
                if !listOfPeriodsForDay.isEmpty {
                    for c in 0...listOfPeriodsForDay.count-1 {
                        scheduleForCurrentDay.append(Period(name: listOfPeriodsForDay[c], startTime: listOfStartTimesForDay[c], endTime: listOfEndTimesForDay[c]))
                    }
                } else {
                    dayAndDate.text = String(getDayOfWeek(todayDate)!) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(No School!)"
                }
                
                
                
                
                
                
                if let dayOfWeek = getDayOfWeek(todayDate){
                    
                    if dayOfWeek != "Monday" && dayOfWeek != "Tuesday" && dayOfWeek != "Wednesday" && dayOfWeek != "Thursday" && dayOfWeek != "Friday" {
                        dayAndDate.text = String(dayOfWeek) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(No School!)"
                    }
                    
                    let displayedText = String(dayOfWeek) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(Alternate Schedule)"
                    
                    
                    dayAndDate.text = displayedText
                    
                    if displayedText.characters.count <= 38 {
                        dayAndDate.font = UIFont.systemFontOfSize(17)
                    } else if displayedText.characters.count <= 40 {
                        dayAndDate.font = UIFont.systemFontOfSize(16)
                    } else if displayedText.characters.count <= 42 {
                        dayAndDate.font = UIFont.systemFontOfSize(15)
                    } else if displayedText.characters.count <= 45 {
                        dayAndDate.font = UIFont.systemFontOfSize(14)
                    } else if displayedText.characters.count <= 47 {
                        dayAndDate.font = UIFont.systemFontOfSize(13)
                    } else if displayedText.characters.count <= 50 {
                        dayAndDate.font = UIFont.systemFontOfSize(12)
                    } else {
                        dayAndDate.font = UIFont.systemFontOfSize(11)
                    }
                    
                    
                    
                    
                }
                
            } else { // the code below is for regular schedules
                if var dayOfWeek = getDayOfWeek(todayDate) {
                    
                    var displayedText = String(dayOfWeek) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(Regular Schedule)"
                    
                    dayAndDate.text = displayedText
                    
                    if displayedText.characters.count <= 38 {
                        dayAndDate.font = UIFont.systemFontOfSize(17)
                    } else if displayedText.characters.count <= 40 {
                        dayAndDate.font = UIFont.systemFontOfSize(16)
                    } else if displayedText.characters.count <= 42 {
                        dayAndDate.font = UIFont.systemFontOfSize(15)
                    } else if displayedText.characters.count <= 45 {
                        dayAndDate.font = UIFont.systemFontOfSize(14)
                    } else if displayedText.characters.count <= 47 {
                        dayAndDate.font = UIFont.systemFontOfSize(13)
                    } else if displayedText.characters.count <= 50 {
                        dayAndDate.font = UIFont.systemFontOfSize(12)
                    } else {
                        dayAndDate.font = UIFont.systemFontOfSize(11)
                    }
                    
                    
                    if dayOfWeek == "Monday" {
                        scheduleForCurrentDay.append(Period(name: "A", startTime: "8:25", endTime: "9:45"))
                        scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:45", endTime: "10:00"))
                        scheduleForCurrentDay.append(Period(name: "B", startTime: "10:00", endTime: "11:15"))
                        scheduleForCurrentDay.append(Period(name: "C", startTime: "11:25", endTime: "12:40"))
                        scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:40", endTime: "1:20"))
                        scheduleForCurrentDay.append(Period(name: "F", startTime: "1:20", endTime: "2:35"))
                        
                        
                    } else if dayOfWeek == "Tuesday" {
                        scheduleForCurrentDay.append(Period(name: "D", startTime: "8:25", endTime: "9:45"))
                        scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:45", endTime: "10:00"))
                        scheduleForCurrentDay.append(Period(name: "FlexTime", startTime: "10:00", endTime: "10:50"))
                        scheduleForCurrentDay.append(Period(name: "E", startTime: "11:00", endTime: "12:15"))
                        scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:15", endTime: "12:55"))
                        scheduleForCurrentDay.append(Period(name: "A", startTime: "12:55", endTime: "2:15"))
                        scheduleForCurrentDay.append(Period(name: "G", startTime: "2:25", endTime: "3:40"))
                        
                        
                    } else if dayOfWeek == "Wednesday" {
                        scheduleForCurrentDay.append(Period(name: "B", startTime: "8:25", endTime: "9:50"))
                        scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:50", endTime: "10:05"))
                        scheduleForCurrentDay.append(Period(name: "C", startTime: "10:05", endTime: "11:25"))
                        scheduleForCurrentDay.append(Period(name: "D", startTime: "11:35", endTime: "12:55"))
                        scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:55", endTime: "1:35"))
                        scheduleForCurrentDay.append(Period(name: "F", startTime: "1:35", endTime: "2:55"))
                        
                    } else if dayOfWeek == "Thursday" {
                        scheduleForCurrentDay.append(Period(name: "E", startTime: "8:25", endTime: "9:50"))
                        scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:50", endTime: "10:05"))
                        scheduleForCurrentDay.append(Period(name: "A", startTime: "10:05", endTime: "11:15"))
                        scheduleForCurrentDay.append(Period(name: "B", startTime: "11:25", endTime: "12:35"))
                        scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:35", endTime: "1:15"))
                        scheduleForCurrentDay.append(Period(name: "G", startTime: "1:15", endTime: "2:35"))
                        scheduleForCurrentDay.append(Period(name: "Tutorial", startTime: "2:45", endTime: "3:35"))
                        
                    } else if dayOfWeek == "Friday" {
                        scheduleForCurrentDay.append(Period(name: "C", startTime: "8:25", endTime: "9:40"))
                        scheduleForCurrentDay.append(Period(name: "Brunch", startTime: "9:40", endTime: "9:55"))
                        scheduleForCurrentDay.append(Period(name: "D", startTime: "9:55", endTime: "11:05"))
                        scheduleForCurrentDay.append(Period(name: "E", startTime: "11:15", endTime: "12:25"))
                        scheduleForCurrentDay.append(Period(name: "Lunch", startTime: "12:25", endTime: "1:05"))
                        scheduleForCurrentDay.append(Period(name: "F", startTime: "1:05", endTime: "2:15"))
                        scheduleForCurrentDay.append(Period(name: "G", startTime: "2:25", endTime: "3:35"))
                        
                    } else {
                        displayedText = String(dayOfWeek) + ", " + String(monthConverter(month)) + " " + String(day) + ", " + String(year) + " " + "(No School!)"
                        dayAndDate.text = displayedText
                        if displayedText.characters.count <= 38 {
                            dayAndDate.font = UIFont.systemFontOfSize(17)
                        } else if displayedText.characters.count <= 40 {
                            dayAndDate.font = UIFont.systemFontOfSize(16)
                        } else if displayedText.characters.count <= 42 {
                            dayAndDate.font = UIFont.systemFontOfSize(15)
                        } else if displayedText.characters.count <= 45 {
                            dayAndDate.font = UIFont.systemFontOfSize(14)
                        } else if displayedText.characters.count <= 47 {
                            dayAndDate.font = UIFont.systemFontOfSize(13)
                        } else if displayedText.characters.count <= 50 {
                            dayAndDate.font = UIFont.systemFontOfSize(12)
                        } else {
                            dayAndDate.font = UIFont.systemFontOfSize(11)
                        }
                    }
                    
                    
                }
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func adjustTextSize(label: UILabel) {
        if label.text!.characters.count <= 38 {
            dayAndDate.font = UIFont.systemFontOfSize(17)
        } else if label.text!.characters.count <= 40 {
            dayAndDate.font = UIFont.systemFontOfSize(16)
        } else if label.text!.characters.count <= 42 {
            dayAndDate.font = UIFont.systemFontOfSize(15)
        } else if label.text!.characters.count <= 45 {
            dayAndDate.font = UIFont.systemFontOfSize(14)
        } else if label.text!.characters.count <= 47 {
            dayAndDate.font = UIFont.systemFontOfSize(13)
        } else if label.text!.characters.count <= 50 {
            dayAndDate.font = UIFont.systemFontOfSize(12)
        } else {
            dayAndDate.font = UIFont.systemFontOfSize(11)
        }
    }
    
    
    
    func getDayOfWeek(today:String)->String? {
        
        let formatter  = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let todayDate = formatter.dateFromString(today) {
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let myComponents = myCalendar.components(.Weekday, fromDate: todayDate)
            let weekDay = myComponents.weekday
            if weekDay == 1 {
                return "Sunday"
            } else if weekDay == 2 {
                return "Monday"
            } else if weekDay == 3 {
                return "Tuesday"
            } else if weekDay == 4 {
                return "Wednesday"
            } else if weekDay == 5 {
                return "Thursday"
            } else if weekDay == 6 {
                return "Friday"
            } else  {
                return "Saturday"
            }
        } else {
            return nil
        }
    }
    
    
    func monthConverter(num: Int) -> String {
        if num == 1 {
            return "January"
        } else if num == 2 {
            return "February"
        } else if num == 3 {
            return "March"
        } else if num == 4 {
            return "April"
        } else if num == 5 {
            return "May"
        } else if num == 6 {
            return "June"
        } else if num == 7 {
            return "July"
        } else if num == 8 {
            return "August"
        } else if num == 9 {
            return "September"
        } else if num == 10 {
            return "October"
        } else if num == 11 {
            return "November"
        } else {
            return "December"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return scheduleForCurrentDay.count
        return scheduleForCurrentDay.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("IT JUST RAN")
        let cell = tableView.dequeueReusableCellWithIdentifier("ScheduleViewCell", forIndexPath: indexPath) as! ScheduleViewCell
        
        let row = indexPath.row
        let thePeriod = scheduleForCurrentDay[row].getName()
        
        
        cell.period.text = thePeriod
        cell.periodTime.text = String(scheduleForCurrentDay[row].getStartTime()) + "-" + String(scheduleForCurrentDay[row].getEndTime())
        
        
        if (cell.period.text!.rangeOfString("Regular Schedule") != nil) && whichSegControl == 2 {
            
            cell.period.font = UIFont.boldSystemFontOfSize(17)
            cell.periodTime.text = " "
            
        } else if cell.period.text!.characters.count > 23 {
            cell.period.font = UIFont.systemFontOfSize(11)
        } else {
            cell.period.font = UIFont.systemFontOfSize(17)
        }
        
        
        return cell
    }
    
    
    
}



