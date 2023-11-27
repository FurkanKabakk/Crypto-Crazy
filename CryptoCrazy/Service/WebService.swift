//
//  WebService.swift
//  CryptoCrazy
//
//  Created by furkan on 18.07.2023.
//

import Foundation

class Webservice {
    
    func downloadCurrency(url:URL, completion: @escaping([CryptoModel]?) -> ()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoModel].self, from: data)
                completion(cryptoList)
            }
        }.resume()
        
    }
}
