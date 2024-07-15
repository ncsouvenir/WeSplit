//
//  Pickers.swift
//  WeSplit
//
//  Created by Nic Souvenir on 7/15/24.
//

import SwiftUI

struct Pickers: View {
    let students = ["Larry", "Curly", "Mo"]
    @State private var selectedStudent = "Larry"
    
    var body: some View {
        NavigationStack {
            Form {
                /*
                 The Picker has a two-way binding to selectedStudent, which means it will start showing a selection of “Larry” but update the property when the user selects something else.
                 */
                Picker("Select your student", selection: $selectedStudent) {
                    /*  
                     \.self == The strings themselves are unique.
                     
                     SwiftUI asks us what identifier makes each item in our
                     string array uniqu */

                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    Pickers()
}
