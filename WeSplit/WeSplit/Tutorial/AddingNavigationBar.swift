//
//  AddingNavigationBar.swift
//  WeSplit
//
//  Created by Brandon Johns on 7/6/23.
//

import SwiftUI

struct AddingNavigationBar: View {
    var body: some View {
        NavigationView
        { // NavigationView allows space at top
            Form {
                Section
                {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline) // smaller title 
            // whole Form has this title
        }
    }
}

struct AddingNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        AddingNavigationBar()
    }
}
