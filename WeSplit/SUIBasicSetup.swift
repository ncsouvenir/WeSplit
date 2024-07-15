//
//  SUIBasicSetup.swift
//  WeSplit
//
//  Created by Nic Souvenir on 7/11/24.
//

import Foundation...
import SwiftUI


// MARK: Creates a new struct called ContentView, saying that it conforms to the View protocol. View comes from SwiftUI, and is the basic protocol that must be adopted by anything you want to draw on the screen – all text, buttons, images, and more are all views, including your own layouts that combine other views.

struct BasicStructureExample: View {
    
    // MARK: Defines a new computed property called body, which has an interesting type: some View. This means it will return something that conforms to the View protocol, which is our layout. Behind the scenes this will actually result in a very complicated data type being returned based on all the things in our layout, but some View means we don’t need to worry about that.
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large) // MARK: SwiftUI modifier
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        
        // MARK: Modifiers always return a new view that contains both your original data, plus the extra modification you asked for. In our case that means the globe image will be shown larger and in blue, and the whole body property will return a padded text view, not just a regular text view
        .padding()
    }
}
  
