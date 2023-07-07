//
//  ModifyingProgrammingState.swift
//  WeSplit
//
//  Created by Brandon Johns on 7/6/23.


// Views are functions of their states
// states are current settings of the state of the program
// property wrappers @State  allow structs to change value
// structs are fixed
// @State: simple properties stored in one view 

import SwiftUI

struct ModifyingProgrammingState: View {
     @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct ModifyingProgrammingState_Previews: PreviewProvider {
    static var previews: some View {
        ModifyingProgrammingState()
    }
}
