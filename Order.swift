//
//  Order.swift
//  Cupcake Corner
//
//  Created by Luis Alvarez on 1/13/21.
//

import SwiftUI




class Order: ObservableObject, Codable{
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    
    enum CodingKeys: CodingKey {
        case cakeType
        case cakesOrdered
        case name
        case address
        case city
        case zip
        case specialRequest
        case extraFrosting
        case addSprinkles
    }
    
    init() { }// Done so that we don't require anything to insantiate
    
    required init(from decoder: Decoder) throws {
        
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            self.cakeType = try container.decode(Int.self, forKey: .cakeType)
            self.cakesOrdered = try container.decode(Int.self, forKey: .cakesOrdered)
            self.name = try container.decode(String.self, forKey: .name)
            self.address = try container.decode(String.self, forKey: .address)
            self.city = try container.decode(String.self, forKey: .city)
            self.specialRequest = try container.decode(Bool.self, forKey: .specialRequest)
            self.extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
            self.addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(cakeType, forKey: .cakeType)
        try container.encode(cakesOrdered, forKey: .cakesOrdered)
        try container.encode(address, forKey: .address)
        try container.encode(city, forKey: .city)
        try container.encode(specialRequest, forKey: .specialRequest)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
    }
    
    
    
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
    
    var price:Double {
        var cost:Double = 2
        
        if extraFrosting {
            cost += 1.0
        }
        
        if addSprinkles {
            cost += 0.5
        }
        
        return cost * (Double)(cakesOrdered)
    }
    
    
    var hasValidAddress:Bool {
        if name.isEmpty || address.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    

    
    
    
    
    
}
