//
//  BirthdaysListServiceMock.swift
//  BirthdaysListTests
//
//  Created by Mohammed Abd El-Aty on 18/02/2022.
//

import Foundation
@testable import BirthdaysList

class BirthdaysLisServicetMock: BirthdaysListServiceProtocol {
    let urlString: String

    required public init(urlString: String ) {
        self.urlString = urlString
    }


    func getBirthdaysList(handler: @escaping (Result<BirthdaysListModel, BirthdaysAppErrors>) -> Void) {
        guard let data = Utils.readLocalFile(forName: urlString) else {
            handler(.failure(BirthdaysAppErrors.NotFound))
            return
        }

        guard let result = Utils.parse(jsonData: data) else {
            handler(.failure(BirthdaysAppErrors.WrongData))
            return
        }

        handler(.success(result))
    }


}
