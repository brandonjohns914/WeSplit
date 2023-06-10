//
//  ContentView.swift
//  WeSplit
//
//  Created by Brandon Johns on 6/7/23.
//

import SwiftUI

struct ContentView: View
{
    @State private var checkAmount = 0.0                                                                                //@State watches for changes in its value
                                                                                                                        //     is required to get checkAmount to work
                                                                                                                        //      when changes it reruns and updates body
                                                                                                                        // step 1 make value @state so its read/write
                                                                                                                        // step 2 $bind value wish to see updated
                                                                                                                        // step 3 body is updated and value is updated
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
                                                                                                                        
    
    let tipPercentages = 0..<101
    
    var totalPerPerson: Double
    {
        let peopleCount = Double(numberOfPeople + 2)                                                                    //converting to double
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        
        let grandTotal = checkAmount + tipValue
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
                                                                                                                        
    var body: some View
    {
        
        NavigationView
        {
            
            Form
            {
                
                Section
                {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    //$checkAmount now reads and writes
                    //format changes it from default string to double
                    .keyboardType(.decimalPad)                                                                      //removes default letter keyboard for decimal
                    .focused($amountIsFocused)
                    .foregroundColor(.green)
        
                    
                    
                    
                    Picker("Number of people", selection: $numberOfPeople)
                    {
                        ForEach(2..<100)
                        {
                            Text("\($0) people")
                        }
                    }//picker
                    
                }//Input amount
                
                Section
                {
                    Picker("Tip Percentage", selection: $tipPercentage)
                    {
                        ForEach(tipPercentages, id: \.self)                                                              //id: \.self = each item is unique and identify them
                        {
                            Text($0, format: .percent)
                                .foregroundColor(($0 != 0) ? .blue : .red)
                            
                        }
                        
                    }//picker
                    .pickerStyle(.navigationLink)
                } header:
                {
                    Text("How much tip do you want to leave?")
                }// Tip Percentage
                
                
                Section
                {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(.blue)
                } header:
                {
                    Text("Per Person Amount")
                }
                // Display Amount
                
                Section
                {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(.green)
                    
                } header: {
                    Text("Total amount")
                }
                
                Section
                {
                    let tipSelection = Double(tipPercentage)
                    let tipValue = checkAmount / 100 * tipSelection
                    Text(tipValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(tipPercentage != 0 ? .black : .red )
                }header: {
                    Text("Tip amount based onto total amount")
                }
                
            }//Form
            .navigationTitle("WeSplit")
            .toolbar
            {
                ToolbarItemGroup(placement: .keyboard)                                                              // tool bar button appears above keyboard
                {
                    Spacer()                                                                                        // pushes view to right or left
                    Button("Done")
                    {
                        amountIsFocused = false                                                                     // toolbar disappears when the keyboard is disappears
                    }//button
                }//group
            }//toolbar
        
           
        }//NavigationView
    
    }//Body
}//ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
