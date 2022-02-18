//
//  Utils.swift
//  BirthdaysListTests
//
//  Created by Mohammed Abd El-Aty on 18/02/2022.
//

import Foundation
@testable import BirthdaysList

public class Utils {

    public static func readLocalFile(forName name: String) -> Data? {

        let currentBundle = Bundle(for: self)

        do {
            if let bundlePath = currentBundle.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }

        return nil

    }

    public static func parse(jsonData: Data) -> BirthdaysListModel? {
        do {
            let decodedData = try JSONDecoder().decode(BirthdaysListModel.self,
                                                       from: jsonData)
            return decodedData

        } catch {
            return nil
        }
    }
}
