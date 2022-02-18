//
//  Constamts.swift
//  BirthdaysList
//
//  Created by Mohammed Abd El-Aty on 18/02/2022.
//

import Foundation


enum FontFamily {
    case bold
    case regular
    case heavy

    var rawValue: String {
        switch self {
        case .bold:
            return "Roboto-bold"
        case .regular:
            return "Roboto-regular"
        case .heavy:
            return "Roboto-black"
        }
    }
}
