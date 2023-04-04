//
//  BmiView.swift
//  BMICalculator
//
//  Created by Gregorius Yuristama Nugraha on 20/03/23.
//

import SwiftUI

func calcBMI(weight: Double, height: Double) -> Double{
    return weight/pow(height/100,2.0)
}

func statusBMI(bmiIndex: Double) -> Text{
    var bmiString: String = ""
    var bmiColor: Color = .black
    if bmiIndex < 18.5{
        bmiString = "Underweight"
        bmiColor = .gray
    } else if bmiIndex >= 18.5 && bmiIndex < 25{
        bmiString = "Healthy"
        bmiColor = .green
    } else if bmiIndex >= 25 && bmiIndex < 30{
        bmiString = "Overweight"
        bmiColor = .orange
    } else if bmiIndex >= 30{
        bmiString = "Obese"
        bmiColor = .red
    }
    return Text(bmiString)
        .foregroundColor(bmiColor)
    
}

struct BmiView: View {
    @State var weight: Double
    @State var height: Double
    @Binding var savedHistory: [Bmi]
    var body: some View {
        VStack{
            HStack{
                Text("Weight(kg)")
                    .foregroundColor(.gray)
                Spacer()
                Text("\(weight, specifier: "%.0f") kg")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            Slider(value: $weight, in: 1...100)
            
            Divider()
            HStack{
                Text("Height(cm)")
                    .foregroundColor(.gray)
                Spacer()
                
                Text("\(height, specifier: "%.0f") cm")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Slider(value: $height, in: 1...300)
            Divider()
            HStack{
                Text("Your Body Mass Index")
                    .foregroundColor(.gray)
                Spacer()
                VStack{
                    Text("\(calcBMI(weight: weight, height: height), specifier: "%.2f")")
                        .font(.title)
                        .fontWeight(.bold)
                    statusBMI(bmiIndex:calcBMI(weight: weight, height: height))
                }
            }
            Button(){
                savedHistory.append(Bmi(date: Date(), result: calcBMI(weight: weight, height: height)))
            }label: {
                Text("Save To History")
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color(.systemBlue))
            .cornerRadius(8)
            Spacer()
        }
        
    }
}

struct BmiView_Previews: PreviewProvider {
    
    static var previews: some View {
        BmiView(weight: 20, height: 20, savedHistory: .constant([Bmi(date: Date(), result: 20.0)]))
    }
}
