//
//  CheckOutView.swift
//  Cupcake Corner
//
//  Created by Luis Alvarez on 1/13/21.
//

import SwiftUI

struct CheckOutView: View {
    
    @ObservedObject var order:Order
    
    var body: some View {
        NavigationView{
            GeometryReader{geo in
                ScrollView(.vertical){
                    VStack{
                        Image("cupcakes")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width)
                    
                    Spacer(minLength: 50)
                    
                    Text("Total price: \(order.price, specifier: "%.2f")")
                        .font(.title2)
                        .bold()
                    
                    
                    
                    Button(action: {
                        // TODO: Add implementation. Should convert class to JSON
                        // And connect w internet by sending and receiving info
                    }){
                        Text("Order")
                            .padding()
                            .font(.title2)
                            .frame(width: geo.size.width)
                            .background(Color.red)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                            //.background(Color.red)
                    }
                    }
                  
                    
                }
                .navigationBarTitle("Checkout", displayMode: .inline)
            }
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
