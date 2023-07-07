//
//  BindingStateUI.swift
//  WeSplit
//
//  Created by Brandon Johns on 7/6/23.


//Views are functions of their state
//Textfields needs somewhere to save the value and show how it updates
//Two way binding: '$' binds the value
//$name is stored and read back as the user types in the textfield

import SwiftUI

struct BindingStateUI: View {
    
    @State private var name = ""
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is: \(name)")
        }
    }
}

struct BindingStateUI_Previews: PreviewProvider {
    static var previews: some View {
        BindingStateUI()
    }
}
