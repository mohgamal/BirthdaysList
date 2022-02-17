//
//  BirthdaysModel.swift
//  BirthdaysList
//
//  Created by Mohammed Abd El-Aty on 17/02/2022.
//

import Foundation

struct BirthdaysListModel: Codable {
    let results : [BirthdayModel]?
    let info : InfoModel?
}
