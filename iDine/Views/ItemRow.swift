//
//  ItemRow.swift
//  iDine
//
//  Created by Oluwafunmilayo Adewodu on 09/07/2019.
//  Copyright © 2019 Oluwafunmilayo Adewodu. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var item: MenuItem
    @EnvironmentObject var order: Order
    @EnvironmentObject var favourite: Favourite
    
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item).environmentObject(order).environmentObject(favourite)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("£\(item.price)")
                }
                
                Spacer()
                
                ForEach(item.restrictions.identified(by: \.self)) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black]) // dict default value? swift 3/4
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#if DEBUG
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
#endif
