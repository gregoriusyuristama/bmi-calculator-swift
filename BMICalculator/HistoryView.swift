//
//  HistoryView.swift
//  BMICalculator
//
//  Created by Gregorius Yuristama Nugraha on 20/03/23.
//

import SwiftUI

struct HistoryView: View {
    @Binding var savedHistory: [Bmi]
    var body: some View {
        List(savedHistory){bmi in
            VStack{
                HStack{
                    Text("\(Date().formatted(date: .abbreviated, time: .shortened))")
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack{
                    Text("\(bmi.result, specifier: "%.2f")")
                        .font(.title)
                        .bold()
                        
                    Spacer()
                    statusBMI(bmiIndex: bmi.result)
                        .font(.title2)
//                    Text("Obese")
//                        .font(.title2)
//                        .foregroundColor(.orange)
                }
                .padding(.top, -4)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(savedHistory: .constant([Bmi(date: Date(), result: 22.4)]))
    }
}
