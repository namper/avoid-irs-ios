//
//  Model.swift
//  AvoidIRS
//
//  Created by Mishiko Okropiridze on 24.04.22.
//

import Foundation


enum Currency{
    case USD
    case GEL
}


class TaxInput: ObservableObject{
    @Published var date: Date = Date.now
    @Published var currency: Currency
    var amount: Double
    
    init(amount: Double, currency: Currency = .USD){
        self.amount = amount
        self.currency = currency
    }

}
