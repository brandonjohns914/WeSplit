//
//  CreatingForm.swift
//  WeSplit
//
//  Created by Brandon Johns on 7/6/23.
//

import SwiftUI

struct CreatingForm: View {
    var body: some View {
        Form {
            // Form can only have 10 items not in a Group
            Group {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            Section {
                // gap between groups 
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct CreatingForm_Previews: PreviewProvider {
    static var previews: some View {
        CreatingForm()
    }
}
