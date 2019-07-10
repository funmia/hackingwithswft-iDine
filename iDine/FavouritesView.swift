//
//  FavouritesView.swift
//  iDine
//
//  Created by Oluwafunmilayo Adewodu on 09/07/2019.
//  Copyright © 2019 Oluwafunmilayo Adewodu. All rights reserved.
//

import SwiftUI

struct FavouritesView : View {
        @EnvironmentObject var favourite: Favourite
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(favourite.items) { item in
                    ItemRow(item: item)
                    
                }
            }
        }
    }
}

#if DEBUG
struct FavouritesView_Previews : PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
#endif
