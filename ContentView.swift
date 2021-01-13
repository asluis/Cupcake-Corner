//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Luis Alvarez on 1/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var username = ""
    @State var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                print("Creating account…")
                }
            }.disabled(username.isEmpty || email.isEmpty)//Disabled if no input

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
