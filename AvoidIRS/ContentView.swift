//
//  ContentView.swift
//  AvoidIRS
//
//  Created by Mishiko Okropiridze on 24.04.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var taxInput = TaxInput(amount: "200")
    @State private var ownedToIRS = ""
    @State private var OwnedToIRSComponentIsHidden = true;
    

    var body: some View {
        VStack{
            Text("Compute Tax").frame(width: 500, height: 50, alignment: .center).padding().padding()
            
            VStack{
                HStack{
                    Text("Amount: ")
                    TextField("Amount", text: $taxInput.amount)
                        
                }.frame(width: 200, height: 20, alignment: .center)
                HStack{
                    Text("Date: ")
                    DatePicker("", selection: $taxInput.date, displayedComponents: .date)
                        
                }.frame(width: 200, height: 50, alignment: .center)
                Button(
                    action: {
                        ownedToIRS = "5000"
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
                    Text(ownedToIRS)
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
