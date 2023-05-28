//
//  ViewController.swift
//  AM BitCoin
//
//  Created by Yosie Abdul Muzanil on 21/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    var bitCoinManager = BitCoinModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        bitCoinManager.delegate = self
    }


}

extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bitCoinManager.arrayCurrency.count
    }
}

extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bitCoinManager.arrayCurrency[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let targetCurrency = bitCoinManager.arrayCurrency[row]
        bitCoinManager.getCoinPrice(targetCurrency)
    }
}

extension ViewController : ProtocolFunction {
    func didUpdateUI(_ data: APIModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(data.rate)
            self.currencyLabel.text = data.asset_id_quote
        }
    }
    
    func failedUpdateUI(_ error: Error) {
        print(error)
    }
    
    
}

