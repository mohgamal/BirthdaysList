//
//  BirthdaysListViewModel.swift
//  BirthdaysList
//
//  Created by Mohammed Abd El-Aty on 17/02/2022.
//

import Foundation
import Combine

class BirthdaysListViewModel: ObservableObject {
    let birthdaysListService: BirthdaysListService
    var birthdaysList: BirthdaysListModel = BirthdaysListModel(results: [], info: nil)
    var error: Error?

    public let objectWillChange = PassthroughSubject<Void, Never>()

    init(withBirthdaysListService birthdayListService: BirthdaysListService) {
        self.birthdaysListService = birthdayListService
    }

    func getBirthdaysList() {
        birthdaysListService.getBirthdaysList() {[weak self] birthdaysListResult in
            DispatchQueue.main.async {
                switch birthdaysListResult {
                case .success(let birthdaysList):
                    self?.error = nil
                    self?.birthdaysList = birthdaysList
                    self?.objectWillChange.send()
                case .failure(let error):
                    self?.error = error
                    self?.objectWillChange.send()
                }
            }
        }
    }
}
