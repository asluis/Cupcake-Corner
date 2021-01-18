//
//  CheckOutView.swift
//  Cupcake Corner
//
//  Created by Luis Alvarez on 1/13/21.
//

import SwiftUI

struct CheckOutView: View {
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
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
                        self.placeOrder()
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
                .alert(isPresented: $showingConfirmation){
                    Alert(title: Text("Thank you!"), message: Text(confirmationMessage), dismissButton: .default(Text("Ok")))
                }
            }
        }
    }
    
    func placeOrder(){
        let encoder = JSONEncoder()
        
        guard let encoded = try? encoder.encode(order) else{
            print("Fatal error encoding.")
            return
        }
        
        // Force unwrapped because we're sure the string won't fail
        let myURL = URL(string: "https://reqres.in/api/cupcakes")!
        
        var request = URLRequest(url: myURL)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data else{
                print("No data in response \(error?.localizedDescription ?? "UnknownError").")
                return
            }
            if let decoded = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decoded.cakesOrdered)x \(Order.types[decoded.cakeType].lowercased()) cupcakes is on its way!"
                self.showingConfirmation = true
                
            }
            
        }.resume()
        
        
    }
    
    
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
