//
//  CryptoViewModel.swift
//  CryptoCrazy
//
//  Created by furkan on 18.07.2023.
//

import Foundation


struct CrpytoListViewModel {
     let cryptoListViewModel : [CryptoModel]
}

extension CrpytoListViewModel {
    func numberOfRowsInSection()->Int {
        return self.cryptoListViewModel.count
    }
    
    func cryptoAtIndex(_ index:Int)->CryptoModel{
        let crypto = self.cryptoListViewModel[index]
        return crypto
    }
}

/*struct CryptoViewModel {
    let cryptoViewModel : CryptoModel
}

extension CryptoViewModel {
    var name : String {
        return self.cryptoViewModel.currency
    }
    
    var price : String {
        return self.cryptoViewModel.price
    }
}*/
