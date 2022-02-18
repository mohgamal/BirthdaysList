//
//  BirthdayDetailsView.swift
//  BirthdaysList
//
//  Created by Mohammed Abd El-Aty on 18/02/2022.
//

import SwiftUI

struct BirthdayDetailsView: View {
    let birthdayModel: BirthdayModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    init (withBirthdayModel birthdayModel: BirthdayModel) {
        self.birthdayModel = birthdayModel
    }

    var body: some View {

        VStack(alignment: .center) {
            Text("\(birthdayModel.name?.first?.first?.description ?? " ")\(birthdayModel.name?.last?.first?.description ?? " ")")
                .frame(width: 137, height: 137)
                .background(Color.init(red: 0.769, green: 0.769, blue: 0.769))
                .clipShape(Capsule())
                .font(Font.custom(FontFamily.bold.rawValue, size: 64))
            Text("\(birthdayModel.name?.first ?? "") \(birthdayModel.name?.last ?? "")" )
                .font(Font.custom(FontFamily.regular.rawValue, size: 36))
                .padding(.bottom, 5)
            Text(Utils.formatDate(fromFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ", dateString: birthdayModel.dob?.date ?? "", toFormat: "dd-MM-yyy") )
                .font(Font.custom(FontFamily.heavy.rawValue, size: 13))
            Button {
            action: do { self.presentationMode.wrappedValue.dismiss() }
            } label: {
                Text("GO BACK")
                    .frame(minWidth: UIScreen.main.bounds.size.width - 20, maxWidth: .infinity)
                    .font(Font.custom(FontFamily.heavy.rawValue, size: 13))
                    .padding(20)
                    .foregroundColor(Color.white)

            }
            .frame(minWidth: UIScreen.main.bounds.size.width - 20, maxWidth: .infinity, minHeight: 44)
            .background(Color.black)
            .cornerRadius(10)
            .padding([.leading, .trailing, .top], 20)
            Spacer()
        }
        .padding(.top, 50)
        .padding([.leading, .trailing], 0)
        .navigationBarHidden(true)
    }
}
