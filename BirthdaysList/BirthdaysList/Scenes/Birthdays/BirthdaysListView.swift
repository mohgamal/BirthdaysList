//
//  ContentView.swift
//  BirthdaysList
//
//  Created by Mohammed Abd El-Aty on 17/02/2022.
//

import SwiftUI
import Combine

struct BirthdaysListView: View {
    let coloredNavAppearance = UINavigationBarAppearance()
    @ObservedObject public var birthdaysListVM: BirthdaysListViewModel

    init(birthdaysListVM: BirthdaysListViewModel) {

        self.birthdaysListVM = birthdaysListVM

        UITableView.appearance().backgroundColor = .clear
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .white
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font : UIFont(name: "Roboto-Bold", size: 18)!]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }

    var body: some View {
        NavigationView {
            Form {
                ForEach(birthdaysListVM.birthdaysList.results ?? [], id: \.name?.title) { birthday in
                    BirthdayCell(birthdayModel: birthday)
                }
            }
            .navigationTitle("Birthdays")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.white)
        }
        .onAppear {
            self.birthdaysListVM.getBirthdaysList()
        }

    }
}
