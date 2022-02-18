//
//  BirthdayCell.swift
//  BirthdaysList
//
//  Created by Mohammed Abd El-Aty on 18/02/2022.
//

import SwiftUI

struct BirthdayCell: View {
    let birthdayModel: BirthdayModel

    init (birthdayModel: BirthdayModel) {
        self.birthdayModel = birthdayModel
    }


    var body: some View {
        VStack {
            NavigationLink(destination: BirthdayDetailsView(withBirthdayModel: birthdayModel))
            {
                HStack (alignment: .center, spacing: 10) {
                    Text("\(birthdayModel.name?.first?.first?.description ?? " ")\(birthdayModel.name?.last?.first?.description ?? " ")")
                        .frame(width: 69, height: 69)
                        .background(Color.init(red: 0.769, green: 0.769, blue: 0.769))
                        .clipShape(Capsule())
                        .font(Font.custom(FontFamily.bold.rawValue, size: 32))
                    VStack {
                        Text("\(birthdayModel.name?.first ?? "") \(birthdayModel.name?.last ?? "")" )
                            .font(Font.custom(FontFamily.bold.rawValue, size: 13))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 3, trailing: 10))
                        Text(Utils.formatDate(fromFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ", dateString: birthdayModel.dob?.date ?? "", toFormat: "dd-MM-yyy") )
                            .font(Font.custom(FontFamily.regular.rawValue, size: 13))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 10))
                    }
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                }.frame(height: 60)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
        }
    }
}

