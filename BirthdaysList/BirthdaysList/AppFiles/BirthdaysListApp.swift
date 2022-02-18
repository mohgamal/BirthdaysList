//
//  BirthdaysListApp.swift
//  BirthdaysList
//
//  Created by Mohammed Abd El-Aty on 17/02/2022.
//

import SwiftUI

@main
struct BirthdaysListApp: App {
    var body: some Scene {
        WindowGroup {
            let birthdaysListView = BirthdaysListView(birthdaysListVM: BirthdaysListViewModel(withBirthdaysListService: BirthdaysListService(urlString: "https://randomuser.me/api/?results=1000&seed=chalkboard&inc=name,dob")))
            birthdaysListView
        }
    }
}
