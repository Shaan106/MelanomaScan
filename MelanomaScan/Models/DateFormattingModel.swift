//
//  DateFormattingModel.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 10/12/21.
//

import Foundation

class DateFormattingModel {
    
//    let inputDate = "2020-08-22T18:55:36Z"
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//    let date = dateFormatter.date(from: inputDate) ?? Date()
    
    func convertFromISO6801ToDate(inputISODate: String) -> Date {
        
        //2021-12-11T04:11:52.613Z example input

        var newTimeString = ""
        var startAdding = true

        //this produces a string until the input stops obeying iso6801 format
        for c in inputISODate {

            if c == "." {
                startAdding = false
            }

            if startAdding == true {
                newTimeString.append(c)
            }
            
        }
        
        //adding the end character
        newTimeString.append("Z")
        
        //formatting the date
        let inputDate2 = newTimeString.replacingOccurrences(of: "T", with: " ")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        let date = dateFormatter.date(from: inputDate2) ?? Date()
//        print(date)
//        print(newTimeString)

        return date
    }
    
}
