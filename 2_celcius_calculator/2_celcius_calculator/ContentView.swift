//
//  ContentView.swift
//  2_celcius_calculator
//
//  Created by Umut Y. Çalışkan on 3.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var celsius: String = "";
    
    var fahrenheit: Double {
        if let celsiusValue = Double(celsius) {
            return (celsiusValue * 9/5) + 32
        } else {
            return 0
        }
    }
            
    var body: some View {
        VStack {
            Text("Celsius to Fahrenheit")
                .font(.largeTitle)
                .padding()
            
            HStack {
                TextField("Enter Celsius", text: $celsius)
                    .keyboardType(.decimalPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Fahrenheit: \(fahrenheit, specifier: "%.2f")")
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
