//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by furkan on 18.07.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CrpytoListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrency(url: url) { cryptos in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CrpytoListViewModel(cryptoListViewModel: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.currencyLabel.text = cryptoViewModel.currency
        cell.priceLabel.text = cryptoViewModel.price
        
        return cell
    }


}

