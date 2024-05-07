//
//  CryptoCurrencyModel.swift
//  CryptoAppSwiftUI
//
//  Created by Omer Keskin on 7.05.2024.
//

import Foundation

struct CryptoCurrencyModel: Hashable, Decodable, Identifiable{
    
    let id = UUID()
    let currency : String
    let price : String
    
    
    private enum CodingKeys : String, CodingKey{
        case currency = "currency"
        case price = "price"
    }
}
