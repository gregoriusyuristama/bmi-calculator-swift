//
//  ContentView.swift
//  BMICalculator
//
//  Created by Gregorius Yuristama Nugraha on 20/03/23.
//

import SwiftUI



struct ContentView: View {
    @State private var currentIdx = 0
    @State private var weight: Double = 50
    @State private var height: Double = 150
    @State private var savedHistory = [Bmi(date: Date(), result: 24.22)]
    var body: some View {
//        VStack {
//            Text("Body Mass Index")
//                .font(.title)
//                .bold()
            NavigationView(){
                VStack{
                    Picker("Test", selection: $currentIdx){
                        Text("Calculator").tag(0)
                        Text("History").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    if currentIdx == 0 {
                        BmiView(weight: weight, height: height, savedHistory: $savedHistory)
                            .padding()
                    } else{
                        HistoryView(savedHistory: $savedHistory)
                    }
                    
                    
                }
                .navigationTitle("Body Mass Index")
//                .padding()
                
                
            }
            

            
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


