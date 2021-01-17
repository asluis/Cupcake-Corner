//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by Luis Alvarez on 1/13/21.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order:Order
    
    @State var name = ""
    @State var address = ""
    @State var city = ""
    @State var zip = ""
    
    var body: some View {
        NavigationView{
            Form{
                
                Section{
                    TextField("Name", text: $name)
                    TextField("Address", text: $address)
                    TextField("City", text: $city)
                    TextField("ZIP", text: $zip)
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
