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
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        
        // MARK: Locale is a massive struct built to store all the user’s region setting
        formatter.currencyCode = Locale.current.currency?.identifier ?? "USD"
        
        return formatter
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, formatter: currencyFormatter)
                        .keyboardType(.decimalPad)
                }
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
                // Show a new view with the options from our picker
                .pickerStyle(.navigationLink)
            }
            .navigationTitle("Swift UI")
            .navigationBarTitleDisplayMode(.inline)
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
