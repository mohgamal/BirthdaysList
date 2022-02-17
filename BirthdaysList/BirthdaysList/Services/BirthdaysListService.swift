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

class BirthdaysListService: BirthdaysListServiceProtocol {

    let urlString: String

    required public init(urlString: String ) {
        self.urlString = urlString
    }

    func getBirthdaysList(handler: @escaping (Result<BirthdaysListModel, BirthdaysAppErrors>) -> Void) {
        guard let url = URL(string: urlString) else {
            handler(.failure(BirthdaysAppErrors.NotFound))
            return
        }

        let task  = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200...299:
                    break
                case 400:
                    handler(.failure(BirthdaysAppErrors.BadRequest))
                case 404:
                    handler(.failure(BirthdaysAppErrors.NotFound))
                case 500:
                    handler(.failure(BirthdaysAppErrors.InternalServerError))
                default:
                    handler(.failure(BirthdaysAppErrors.InternalServerError))
                }
            }

            guard let data = data else {
                if let error = error {
                    handler(.failure(BirthdaysAppErrors.UnknownError(message: error.localizedDescription)))
                }
                return
            }

            let decoder = JSONDecoder()

            do {
                let result = try decoder.decode(BirthdaysListModel.self, from: data)
                handler(.success(result))
            } catch {
                handler(.failure(BirthdaysAppErrors.WrongData))
            }
        }
        task.resume()
    }
}
