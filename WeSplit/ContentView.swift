//
//  ContentView.swift
//  WeSplit
//
//  Created by Nic Souvenir on 7/11/24.
//
// MARK: Initial user interface (UI) for your program, and is where we’ll be doing all the work in this project.

// MARK: Use all the functionality given to us by the SwiftUI framework
import SwiftUI
import Foundation

// MARK: Creates a new struct called ContentView, saying that it conforms to the View protocol. View is the basic protocol that must be adopted by anything you want to draw on the screen – all text, buttons, images, and more are all views, including your own layouts that combine other views.
struct ContentView: View {
    
    /*
     "Views are a function of their state"
     For example, they can’t tap Continue until they have enter
     their name in a text field. */
    
    /*
     We can’t change their properties because structs are fixed, but
     @State allows that value to be stored separately by SwiftUI
     in aplace that can be modified.
     */
    
    // Tracker: automatically watches for changes then reloads UI
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    // MARK: Specifically designed to handle input focus in our UI i.e keyboard
    @FocusState private var amountIsFocused: Bool

    let tipPercentages = [10, 15, 20, 25, 0]
    
    var currencyCode: String {
        return Locale.current.currency?.identifier ?? "USD"
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        var tipValue = Double(checkAmount / 100) * tipSelection
        var grandTotal = checkAmount + tipValue
        
        return grandTotal / peopleCount
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Check Total") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: currencyCode))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                // Views can be added to the header and footer of sections
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    // Segmented Control
                    .pickerStyle(.segmented)
                }
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
                // Show a new view with the options from our picker
                .pickerStyle(.navigationLink)

                Section("Total Per Person"){
                    Text(totalPerPerson, format: .currency(code: currencyCode))
                }
            }
            .navigationTitle("Swift UI")
            .navigationBarTitleDisplayMode(.inline)

            // MARK: Lets us specify toolbar items for a view.
            .toolbar {
                // Only showing button when the textField is active
                if amountIsFocused {
                    Button("Done") {
                        // dismisses keyboard
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}


// MARK: This is a special piece of code that won’t actually form part of your final app that goes to the App Store, but is instead specifically for Xcode to use so it can show a preview of your UI design alongside your code.
#Preview {
    ContentView()
}

// MARK: Forms
/*
   A dedicated view type for this purpose. Forms are scrolling
   lists of static controls like text and images, but can also include user
   interactive controls like text fields, toggle switches, buttons, and more.
 */
