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
    
    
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    
    let tipPercentages = 0..<101
    
    var tipValue: Double
    {
        return checkAmount / 100 * Double(tipPercentage)
    }
    var grandTotal: Double
    {
        checkAmount + tipValue
    }
    var totalPerPerson: Double
    {
        grandTotal / Double(numberOfPeople + 2)
    }
    
    var tipPerPerson: Double
    {
        tipValue / Double(numberOfPeople + 2)
    }
                                                       
    var body: some View
    {
        
        NavigationView
        {
            
            Form
            {
                
                Section
                {
                    TextField("Amount", value: $checkAmount, format: localCurrency)
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
                    Text(grandTotal, format: localCurrency)
                        .foregroundColor(.green)
                } header: {
                    Text("Total Amount")
                }
                Section
                {
                    Text(tipValue, format: localCurrency)
                        .foregroundColor(tipPercentage != 0 ? .blue : .red )
                }header: {
                    Text("Tip amount")
                }
                
                Section
                {
                    Text(tipPerPerson, format: localCurrency)
                        .foregroundColor(tipPercentage != 0 ? .blue : .red )
                }header: {
                    Text("Tip total per person")
                }
                
                
                Section
                {
                    Text(totalPerPerson, format: localCurrency)
                        .foregroundColor(.green)
                } header:
                {
                    Text("Per Person Amount")
                }
                // Display Amount
                
                
                
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
