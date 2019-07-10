//
//  CheckoutView.swift
//  iDine
//
//  Created by Oluwafunmilayo Adewodu on 09/07/2019.
//  Copyright © 2019 Oluwafunmilayo Adewodu. All rights reserved.
//

import SwiftUI

struct CheckoutView : View {
    @EnvironmentObject var order: Order
    static let paymentTypes  = ["Cash", "Credit", "Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]

    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State var showingPaymentAlert = false


    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    var body: some View {
        Form {
            Section {
                Picker(selection: $paymentType, label: Text("How do you want to pay?")) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails) {
                    Text("Add iDine loyalty card")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter your iDIne ID", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                SegmentedControl(selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }
            }
            
            Section(header : Text("Total: \(totalPrice, specifier: "%0.2f")")) {
                Button(action: {
                    self.showingPaymentAlert.toggle()
                    
                }) {
                    Text("Confirm order")
                }
            }
        }.presentation($showingPaymentAlert) {
            Alert(title: Text("Order confirmed"),
                  message: Text("Your total was \(totalPrice, specifier: "%0.2f") - thank you!"),
                    dismissButton: .default(Text("OK")))
        }
    }
}

#if DEBUG
struct CheckoutView_Previews : PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
#endif
