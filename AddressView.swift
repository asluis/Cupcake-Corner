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
                NavigationLink(destination: CheckOutView(order: order)){
                    Text("Check out")
                }
            }
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
