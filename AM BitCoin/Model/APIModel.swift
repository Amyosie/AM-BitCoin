//
//  APIModel.swift
//  AM BitCoin
//
//  Created by Yosie Abdul Muzanil on 28/05/23.
//

import UIKit

struct APIModel : Codable {
    let asset_id_base : String
    let asset_id_quote : String
    let rate : Float
}
