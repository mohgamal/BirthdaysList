//
//  BirthdaysAppErrors.swift
//  BirthdaysList
//
//  Created by Mohammed Abd El-Aty on 17/02/2022.
//

import Foundation

public enum BirthdaysAppErrors: Error {
    case BadRequest
    case NotFound
    case WrongData
    case InternalServerError
    case UnknownError(message: String)
}

extension BirthdaysAppErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .BadRequest:
            return "A bad request sent to the instance"
        case .NotFound:
            return "No data found using this request"
        case .WrongData:
            return "Error when reading data from remote instance"
        case .InternalServerError:
            return "Internal Server Error"
        case .UnknownError(let message):
            return message
        }
    }
}
