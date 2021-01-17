//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by Luis Alvarez on 1/13/21.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order:Order
    
    var body: some View {
        NavigationView{
            Form{
                
                Section{
                    TextField("Name", text: $order.name)
                    TextField("Address", text: $order.address)
                    TextField("City", text: $order.city)
                    TextField("ZIP", text: $order.zip)
                }
                
                
                Section{
                    NavigationLink(destination: CheckOutView(order: order)){
                        Text("Check out")
                    }
                }
            }
            .navigationBarTitle("Delivery Details", displayMode: .inline)
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
