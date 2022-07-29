//
//  Webservice.swift
//  RicknMorty
//
//  Created by Samuel Santos on 29/07/22.
//

import Foundation

class WebService {
    
    func fetchData(completion: @escaping (Result<[ApiData], Error>) -> Void) {
        
       let page = Int.random(in: 1..<43)
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
           
            guard let data = data, error == nil else {
                fatalError("Bad Request")
            }
            let requestData = try? JSONDecoder().decode(ResultApi.self, from: data)
            completion(.success(requestData?.results ?? [] ))
            
        }.resume()
    }
}
