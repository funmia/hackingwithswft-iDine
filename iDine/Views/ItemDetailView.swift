//
//  ItemDetail.swift
//  iDine
//
//  Created by Oluwafunmilayo Adewodu on 09/07/2019.
//  Copyright © 2019 Oluwafunmilayo Adewodu. All rights reserved.
//

import SwiftUI

struct ItemDetail : View {
    
    var item: MenuItem
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var favourite: Favourite
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .lineLimit(nil)
                .padding(10)
            
            Button(action: {
                self.order.add(item: self.item)
            }) {
                Text("Order this")
                    .font(.headline)
            }
            
            Button(action: {
                self.favourite.add(item: self.item)
            }) {
               Image("system-heart")
            }
            
            Spacer()
        }.navigationBarTitle("\(item.name)", displayMode: .inline)
    }
}

#if DEBUG
struct ItemDetail_Previews : PreviewProvider {
    static let order = Order()

    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
#endif
