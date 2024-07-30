//
//  ContentView.swift
//  1_calculator_app
//
//  Created by Umut Y. Çalışkan on 29.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var result: String = ""
    
    enum Operation {
            case addition
            case subtraction
            case multiplication
            case division
        }
    
    func calculateResult(operation: Operation) {
            guard let num1 = Double(firstNumber), let num2 = Double(secondNumber) else {
                result = "Invalid input"
                return
            }
            
            switch operation {
            case .addition:
                result = String(num1 + num2)
            case .subtraction:
                result = String(num1 - num2)
            case .multiplication:
                result = String(num1 * num2)
            case .division:
                if num2 != 0 {
                    result = String(num1 / num2)
                } else {
                    result = "Cannot divide by zero"
                }
            }
        }
    
    var body: some View {
        VStack {
            
            Text("Hesap Makinesi")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            TextField("First Number", text: $firstNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(8.0)
                .padding()
            TextField("Second Number", text: $secondNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(8.0)
                .padding()
            
            HStack(spacing: 20) {
                Button("Topla") {
                    calculateResult(operation: .addition)
                }
                .frame(width: 80, height: 60 )
                .font(.title3)
                
                Button("Çıkar") {
                    calculateResult(operation: .subtraction)
                }
                .frame(width: 80, height: 60 )
                .font(.title3)
            }
            
            HStack(spacing: 20) {
                Button("Çarp") {
                    calculateResult(operation: .multiplication)
                }
                .frame(width: 80, height: 60 )
                .font(.title3)
                
                Button("Bölme") {
                    calculateResult(operation: .division)
                }
                .frame(width: 80, height: 60 )
                .font(.title3)
            }
            
            Text("SONUÇ: " + result)
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
