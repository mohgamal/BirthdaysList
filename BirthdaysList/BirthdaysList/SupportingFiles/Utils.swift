//
//  Utils.swift
//  BirthdaysList
//
//  Created by Mohammed Abd El-Aty on 18/02/2022.
//

import Foundation

class Utils {
    public static func formatDate(fromFormat: String, dateString: String, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = toFormat
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
}
