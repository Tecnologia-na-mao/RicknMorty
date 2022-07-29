//
//  ApiData.swift
//  RicknMorty
//
//  Created by Samuel Santos on 29/07/22.
//

import Foundation


struct ResultApi: Decodable {
    let info: Info?
    let results: [ApiData]?
}

struct ApiData: Decodable {
    
    let id: Int
    let image: String
    let name: String
    let species: String
    let status: String
    let type: String
    let gender: String
    
}

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String
    
}
