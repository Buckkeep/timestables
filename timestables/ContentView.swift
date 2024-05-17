//
//  ContentView.swift
//  timestables
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 17/05/2024.
//

import SwiftUI


struct ContentView: View {
    
    @State private var value1: Int = 2
    @State private var value2: Int = 2
    
    var displayValue1: Int { value1 + 2 }
    var displayValue2: Int { value2 + 2 }
    
    var answer: Int { (value1 + 2)  * (value2 + 2) }
    
    var body: some View {
        Form {
  
            Section("First number") {
                Picker("Pick your first value", selection: $value1) {
                    ForEach(2..<13) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Second number") {
                Picker("Pick your second value", selection: $value2) {
                    ForEach(2..<13) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(displayValue1) x \(displayValue2) is \(answer)!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
