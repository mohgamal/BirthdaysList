//
//  BirthdaysListService.swift
//  BirthdaysList
//
//  Created by Mohammed Abd El-Aty on 17/02/2022.
//

import Foundation

protocol BirthdaysListServiceProtocol {
    init (urlString: String)

    func getBirthdaysList(handler: @escaping (Result<BirthdaysListModel, BirthdaysAppErrors>) -> Void)
}

class BirhtdaysListService: BirthdaysListServiceProtocol {

    let urlString: String

    required public init(urlString: String ) {
        self.urlString = urlString
    }

    func getBirthdaysList(handler: @escaping (Result<BirthdaysListModel, BirthdaysAppErrors>) -> Void) {

    }
}
