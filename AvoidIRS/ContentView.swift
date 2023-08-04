//
//  ContentView.swift
//  AvoidIRS
//
//  Created by Mishiko Okropiridze on 24.04.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var taxInput = TaxInput(amount: 200.0)
    @State private var oweToIRS = 0.0;
    @State private var OwnedToIRSComponentIsHidden = true;
    static let percentage_owe_to_irs = 0.01
    

    var body: some View {
        VStack{
            Text("Compute Tax").frame(width: 500, height: 50, alignment: .center).padding().padding()
            
            VStack{
                HStack{
                    Text("Amount USD: ")
                    TextField("Amount", value: $taxInput.amount, format: .number)
                        
                }.frame(width: 300, height: 20, alignment: .center)
                HStack{
                    Text("Date: ")
                    DatePicker("", selection: $taxInput.date, displayedComponents: .date)
                        
                }.frame(width: 200, height: 50, alignment: .center)
                Button(
                    action: {
                        var exchangeRate = 1.0
                        
                        if(taxInput.currency == Currency.USD){
                            exchangeRate = 2.6
                        }
                        
                        oweToIRS = taxInput.amount * exchangeRate * ContentView.percentage_owe_to_irs
                        OwnedToIRSComponentIsHidden = false
                        
                }, label: {
                    Text("Compute")
                })
            }
            .padding()
            .border(.mint, width: 2)
            Spacer()
            HStack{
                if !self.OwnedToIRSComponentIsHidden{
                    Text("You owe to IRS: ")
                    Text(String(oweToIRS))
                    Text("GEL")
                }else{
                    Text("")
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
