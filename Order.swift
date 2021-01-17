//
//  Order.swift
//  Cupcake Corner
//
//  Created by Luis Alvarez on 1/13/21.
//

import SwiftUI




class Order: ObservableObject{
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var cakeType = 0 // Defaults to vanilla
    @Published var cakesOrdered = 3
    @Published var name = ""
    @Published var address = ""
    @Published var city = ""
    @Published var zip = ""
    
    @Published var specialRequest = false {
        didSet{
            if specialRequest == false{
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    
    
    
    
}
