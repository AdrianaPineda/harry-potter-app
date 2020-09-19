//
//  HarryPotterApiClient.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import Alamofire
import Foundation
import PromiseKit

class HarryPotterApiClient: HarryPotterApiClientInterface {
    private let baseUrl: String
    private let apiKey: String

    required init(baseUrl: String, apiKey: String) {
        self.baseUrl = baseUrl
        self.apiKey = apiKey
    }

    func getCharacters() -> Promise<[Character]> {
        return Promise { seal in
            let url = "\(baseUrl)/characters?key=\(apiKey)"
            AF.request(url, method: .get).responseJSON { response in
                print("====>", response)

                guard let data = response.data else {
                    seal.reject(Http.RequestError.invalidResponse("invalid data"))
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode([Character].self, from: data)
                    seal.fulfill(response)
                } catch {
                    seal.reject(Http.RequestError.invalidResponse(error.localizedDescription))
                }
            }
        }
    }
}
