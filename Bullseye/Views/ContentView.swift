//
//  ContentView.swift
//  Bullseye
//
//  Created by Artem on 16.03.2023.
//

import SwiftUI

let backgroundGradient = LinearGradient ( colors: [Color.white, Color.cyan], startPoint: .top, endPoint: .bottom)

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack{
            backgroundGradient
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("🎯🎯🎯")
                        .bold()
                        .multilineTextAlignment(.center)
                        .lineSpacing(7.0)
                        .font(.largeTitle)
                        .kerning(2.0)
                        .padding(.bottom, 20.0)
                    Text(" PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                        .font(.footnote)
                        .bold()
                        .multilineTextAlignment(.center)
                        .lineSpacing(7.0)
                        .kerning(2.0)
                        .padding()
                        
                    Text(String(game.target))
                        .kerning(-1.0)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    HStack {
                        Text("1")
                            .bold()
                            .padding()
                        Slider(value: $sliderValue, in: 1.0...100.0)
                        Text("100")
                            .bold()
                            .padding()
                    }
                    Button("Hit me") {
                        alertIsVisible = true
                    }
                    .alert(
                        "Hello there!",
                        isPresented: $alertIsVisible,
                        actions: {
                            Button("Awesome") {
                                print("Alert closed")
                                game = Game()
                            }
                        },
                        message: {
                            let roundedValue = Int(sliderValue)
                            Text("""
                    The slider value is \(roundedValue).
                    You scored \(game.points(sliderValue: roundedValue)) points this round.
                    """)
                        }
                    )
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
