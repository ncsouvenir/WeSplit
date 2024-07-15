//
//  FormExample.swift
//  WeSplit
//
//  Created by Nic Souvenir on 7/11/24.
//

import Foundation
import SwiftUI

struct FormsNavStackExample: View {
    
    var body: some View {
        
        // MARK: NavStacks can have titles and buttons, and in SwiftUI they also give us the ability to display new views when the user performs an action.
        NavigationStack{
            Form {
                Section{
                    Text("Heyoooooooo")
                    Text("Heyoooooooo")
                }

                Section{
                    Text("Heyoooooooo")
                    Text("Heyoooooooo")
                }
            }
            
            // MARK: When we attach the .navigationTitle() modifier to our form, Swift actually creates a new form that has a navigation title plus all the existing contents you provided.
            .navigationTitle("We Split")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

