//
//  CreatingViewsInLoop.swift
//  WeSplit
//
//  Created by Brandon Johns on 7/6/23.

//ForEach loop over arrays and ranges
//        not stuck in the 10 child item limit
//        created dynamically
//        closure every item
//        useful with Picker view
//    id: \.self
//        == identify every unique view
//        \.self the string itself are unique

//picker read out on voice over


import SwiftUI

struct CreatingViewsInLoop: View {
    
    let students = ["Harry" , "Hermione", "Ron"]
    
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }

                }
            }
        }
    }
}

struct CreatingViewsInLoop_Previews: PreviewProvider {
    static var previews: some View {
        CreatingViewsInLoop()
    }
}
