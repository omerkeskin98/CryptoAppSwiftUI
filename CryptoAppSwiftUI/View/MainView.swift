//
//  ContentView.swift
//  CryptoAppSwiftUI
//
//  Created by Omer Keskin on 7.05.2024.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init(){
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {

        NavigationView{
            List(cryptoListViewModel.cryptoList, id: \.id) { crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(crypto.price)
                        .foregroundStyle(.brown)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.toolbar(content: {
                Button{
                    Task.init{
                        await cryptoListViewModel.downloadCryptosAsync(url: URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
                        print("refreshed")
                    }
                }
            label:{
                Text("Refresh")
            }
            })
            
            
            
            .navigationTitle(Text("Crypto Crazy"))
        }.task {
            await cryptoListViewModel.downloadCryptosAsync(url: URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        
     /* .onAppear{
            cryptoListViewModel.downloadCryptos(url: URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }*/
    }
}

#Preview {
    MainView()
}
