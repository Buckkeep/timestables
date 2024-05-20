//
//  ContentView.swift
//  timestables
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 17/05/2024.
//

import SwiftUI


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack(spacing: -100) {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack(spacing: -100) {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}



struct ContentView: View {
    
    @State private var value1: Int = 2
    @State private var value2: Int = 2
    
    var displayValue1: Int { value1 + 2 }
    var displayValue2: Int { value2 + 2 }
    
    var answer: Int { (value1 + 2)  * (value2 + 2) }
    
    var body: some View {
        VStack {
            
            VStack(alignment: .center, content: {
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
            })
            
                
            GridStack(rows: displayValue1, columns: displayValue2) { row, col in
                    Image("duck")
                        .scaleEffect(0.2)
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
