//
//  CryptoViewModel.swift
//  CryptoAppSwiftUI
//
//  Created by Omer Keskin on 7.05.2024.
//

import Foundation

@MainActor
class CryptoListViewModel : ObservableObject{
    
   @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = WebService()
    
    func downloadCryptosAsync(url: URL) async{
        do{
            let cryptos = try await webservice.downloadCryptosAsync(url: url)
            self.cryptoList = cryptos.map(CryptoViewModel.init)
            
            
        //    DispatchQueue.main.async {
         //       self.cryptoList = cryptos.map(CryptoViewModel.init)}
        }catch{
            print("error")
        }
    }
    
    
    
    
    
    
 /*   func downloadCryptos(url: URL){
        
        webservice.downloadCurrencies(url: url) { result in
            
            switch result{
                
            case.failure(let error):
                print(error)
            case.success(let cryptos):
                if let cryptos = cryptos{
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            }
        }
    }*/
    
}





struct CryptoViewModel{
    
    let crypto : CryptoCurrencyModel
    
    var id : UUID? {
        crypto.id
    }
    
    var price : String{
        crypto.price
    }
    
    var currency : String{
        crypto.currency
    }
}
