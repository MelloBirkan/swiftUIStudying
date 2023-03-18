//
//  ContentView.swift
//  Code History
//
//  Created by Marcello Gonzatto Birkan on 25/11/22.
//

import SwiftUI


struct ContentView: View {
    
    let question = Question(questionText: "What was the first computer bug?", possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"], correctAnswerIndex: 2)
    
    @State var mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
   
    
    var body: some View {
        
        ZStack {
            mainColor.ignoresSafeArea()
            
            VStack {
                    Text("1/10")
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Text(question.questionText)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.leading)
                    Spacer()
                    
                    HStack {
                        
                        ForEach(0..<question.possibleAnswers.count, id: \.self) { answerIndex in
                            
                            Button(action: {
                                print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
                                mainColor = answerIndex == question.correctAnswerIndex ? .green : .red
                            }) {
                                ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                            }
                        }
                        }
                    }
                }
                .foregroundColor(Color.white)
            }
        }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
