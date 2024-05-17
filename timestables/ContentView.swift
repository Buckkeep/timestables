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
        VStack {
            
            Text("How many flocks of ducks?")
                Picker("Pick your first value", selection: $value1) {
                    ForEach(2..<13) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)

            
            Text("How many ducks per flock?")
                Picker("Pick your second value", selection: $value2) {
                    ForEach(2..<13) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            
            HStack {
                ForEach(1..<displayValue1, id: \.self) {_ in
                    ForEach(1..<displayValue2, id: \.self) {_ in
                        Image("duck")
                            .scaleEffect(0.3)
                    }
                }
                .padding(0)
            }
            
            Text("\(displayValue1) flocks of \(displayValue2) ducks is a total of \(answer) ducks!")
        }
        .padding()
        .backgroundStyle(.opacity(0.3))
    }
}

#Preview {
    ContentView()
}
