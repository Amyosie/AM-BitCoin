//
//  BitCoinModel.swift
//  AM BitCoin
//
//  Created by Yosie Abdul Muzanil on 22/05/23.
//

import UIKit

struct BitCoinModel {
    let api_token = "48B5C8B3-EA21-4835-9C21-EF9DB6755AC0"
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    
    var delegate : ProtocolFunction?
    
    let arrayCurrency = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(_ currency :String){
        let finalUrl = "\(baseURL)/\(currency)?apikey=\(api_token)"
        apiProcess(finalUrl)
    }
    
    func apiProcess(_ urlString:String) {
        if let uri = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: uri){
                data, response, error in
                if let safeData = data {
                    if let resultData = parseJSON(safeData) {
                        delegate?.didUpdateUI(resultData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data:Data) -> APIModel? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(APIModel.self, from: data)
            return result
        }catch{
            print(error)
            delegate?.failedUpdateUI(error)
            return nil
        }
    }
}
