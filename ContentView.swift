//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Luis Alvarez on 1/11/21.
//

import SwiftUI

struct ContentView: View {

    
    @ObservedObject var order = Order()

    /*
     We’re going to build the UI for this screen in three sections, starting with cupcake type and quantity. This first section will show a picker letting users choose from Vanilla, Strawberry, Chocolate and Rainbow cakes, then a stepper with the range 3 through 20 to choose the amount. All that will be wrapped inside a form, which is itself inside a navigation view so we can set a title.
     */
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.cakeType){
                        ForEach(0..<Order.types.count, id: \.self){
                            Text("\(Order.types[$0])")
                        }
                    }
                    Stepper(value: $order.cakesOrdered, in: 3...20){
                        Text("Number of cakes: \(order.cakesOrdered)")
                    }
                }
                
                Section{
                    Toggle(isOn: $order.specialRequest.animation()){
                        Text("Any special requests?")
                    }
                    
                    if(order.specialRequest){
                        Toggle(isOn: $order.addSprinkles){
                            Text("Add extra sprinkles")
                        }
                        
                        Toggle(isOn: $order.extraFrosting){
                            Text("Add extra frosting")
                        }
                    }
                }
                
                Section{    
                    NavigationLink(destination: AddressView(order: order)){
                        Text("Delivery details")
                    }
                }
            }.navigationBarTitle("Cupcake Corner")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
