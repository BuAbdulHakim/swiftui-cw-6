//
//  ContentView.swift
//  SwiftUI-CW_6_BMI
//
//  Created by NasserAlsaqabi on 28/12/2020.
//

import SwiftUI
struct BMITextFieldModifier: ViewModifier{
    func body(content: Content) -> some View{
        content
            .multilineTextAlignment(.trailing)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct BMI: View{
    @State var height: String = ""
    @State var weight: String = ""
    @State var bmi:Double = 100
    @State var bmiStatus:String = ""
    
    var body: some View{
        VStack{
            Text("مرحبا بك بحاسبة ال BMI")
                .font(.largeTitle)
                .bold()
            TextField("الطول بالمتر", text: $height).modifier(BMITextFieldModifier())
            TextField("الوزن بالكيلو جرام", text: $weight).modifier(BMITextFieldModifier())
            Button(action:{
                let h = Double(height) ?? 1
                let w = Double(weight) ?? 1
                
                bmi = w/(h*h)
            }, label: {
                Text("إحسب")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .background(Color.red)
                    .clipShape(Capsule())
            })
            
            if bmi <= 20{
                Image("ضعيف")
            }
            else if bmi <= 25{
                Image("جيد")
            }
            else {
                Image("سمين")
            }
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(
                    destination: BMI(),
                    label: {
                        Text("First View")
                    })
                    .navigationTitle("Nav Title")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}
