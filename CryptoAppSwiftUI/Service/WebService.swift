//
//  WebService.swift
//  CryptoAppSwiftUI
//
//  Created by Omer Keskin on 7.05.2024.
//

import Foundation

class WebService{
    
    
    func downloadCryptosAsync(url: URL) async throws -> [CryptoCurrencyModel]{
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoCurrencyModel].self, from: data)
        return currencies ?? []
    }
    
    
    
    
    
    
    
    
  /*  func downloadCurrencies(url: URL, completion: @escaping (Result<[CryptoCurrencyModel]?, DownloadError>) -> Void){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
            guard let currencies = try? JSONDecoder().decode([CryptoCurrencyModel].self, from: data) else{
                return completion(.failure(.dataParseError))
            }
            
            completion(.success(currencies))
        }.resume()
    } */
    
    
    
    
    
    enum DownloadError : Error{
        case badUrl
        case noData
        case dataParseError
    }
    
    
    
    
}
