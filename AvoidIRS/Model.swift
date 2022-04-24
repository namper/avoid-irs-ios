//
//  Model.swift
//  AvoidIRS
//
//  Created by Mishiko Okropiridze on 24.04.22.
//

import Foundation


enum Currency{
    case usd
    case gel
}

class TaxInput: ObservableObject{
    @Published var amount: String
    @Published var date: Date = Date.now
    var currrency: Currency
    
    
    init(amount: String, currency: Currency = .usd){
        self.amount = amount
        self.currrency = currency
    }

}
