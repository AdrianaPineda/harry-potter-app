//
//  Http.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import Foundation

enum Http {
    enum Method {
        case get
        case post
    }

    enum RequestError: LocalizedError {
        case invalidResponse(String?)
    }
}
