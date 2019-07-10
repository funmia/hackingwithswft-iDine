//
//  Favourite.swift
//  iDine
//
//  Created by Oluwafunmilayo Adewodu on 09/07/2019.
//  Copyright © 2019 Oluwafunmilayo Adewodu. All rights reserved.
//

import Combine
import SwiftUI

class Favourite: BindableObject {
    
    var didChange = PassthroughSubject<Void, Never>()
    
    var items = [MenuItem]() {
        didSet {
            didChange.send()
        }
    }

    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
