//
//  @StateExample.swift
//  WeSplit
//
//  Created by Nic Souvenir on 7/11/24.
//

import Foundation
import SwiftUI


struct StateTwoWayBindingExample: View {
    // MARK: The things people can see and what they can interact with – are determined by the state of your program. For example,       they can’t tap Continue until they have entered their name in a text field.
    
    // MARK: State – the active collection of settings that describe how the game is right now.
    
    // MARK: @State allows us to work around the limitation of structs: we know we can’t change their properties because structs are fixed, but @State allows that value to be stored separately by SwiftUI in a place that can be modified.
    
    // MARK: SwiftUI destroys and recreates your structs frequently, so keeping them small and simple is important for performance.

    // MARK: Use for simple properties stored in 1 view
    @State private var tapCount = 0
    @State private var name = ""
    
    var body: some View {
        
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
        
        Form {
            // MARK: $ == 2way binding. $ tells Swift that it should read the value of the property but also write it back as any changes happen.
            // MARK: When a name is entered in the TF, the name property will be read and updated
            TextField("Enter your name", text: $name)
            
            // MARK: We don't want 2 way binding here. Just want to read the value.
            Text("Hello! Your name is \(name)")
        }
    }
}

