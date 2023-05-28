//
//  delegateFunction.swift
//  AM BitCoin
//
//  Created by Yosie Abdul Muzanil on 28/05/23.
//

import UIKit

protocol ProtocolFunction {
    func didUpdateUI(_ data:APIModel)
    func failedUpdateUI(_ error:Error)
}
