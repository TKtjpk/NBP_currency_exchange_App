//
//  Model.swift
//  NASK
//
//  Created by Tomasz Kubicki on 28/08/2023.
//

import Foundation

struct Table: Decodable, Identifiable {
    var table: String?
    var id: String?
    var effectiveDay: String?
    var rates: [Rate]?
    
    enum CodingKeys: String, CodingKey {
        case id = "No"

        case table
        case effectiveDay
        case rates
    }
}

struct Rate: Decodable, Identifiable {
    var id: String?
    var currency: String?
    var mid: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "code"
        
        case currency
        case mid
    }
}
