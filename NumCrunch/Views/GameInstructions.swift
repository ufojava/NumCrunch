//
//  GameInstructions.swift
//  NumCrunch
//
//  Created by Ufuoma Okoro on 17/04/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//File to produce game instructions
import SwiftUI






struct GameInstructions: View {
    
@State private var showPlayGame = false
@State private var showPlayGameText = false
    
@State private var showTutorial = false
@State private var showTutorialText = false
    
    
@State private var showClickBeginGame = false
@State private var showClickBeginGameText = false
    
    
@State private var showMemoriseNumber = false
@State private var showMemoriseNumberText = false
    
    
@State private var showNumberPad = false
@State private var showNumberPadText = false
    
    
@State private var showNumberDigits = false
@State private var showNumberDigitsText = false
    
    
@State private var showClickOperators = false
@State private var showClickOperatorsText = false
    
    
@State private var showClickPlayNumbers = false
@State private var showClickPlayNumbersText = false
    
    
@State private var showStatisics = false
@State private var showStatisicsText = false
    
    
@State private var showResetGame = false
@State private var showResetGameText = false
    
    
//Tutorial Counter
    @State private var tutorialCounter = 0
    
    var body: some View {
        
        
        VStack {
            
            ZStack(alignment: .top) {
        
                Color(red: 0.5, green: 0.3, blue: 0.4).edgesIgnoringSafeArea(.all)
                
                VStack {
                
                            HStack {
                            Text("Click Next for More")
                                .frame(width:250,height: 30,alignment: .leading)
                                .font(.custom("American Typewriter", size: 23))
                                .foregroundColor(Color.white)
                                Spacer().frame(width:30)
                                
                                
                            
                            
                                Button(action: {
                                    
                                    self.tutorialCounter += 1
                                    
                                    //First Screen
                                    if self.tutorialCounter == 1 {
                                        
                                        withAnimation {
                                            
                                            self.showPlayGame.toggle()
                                        

                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showPlayGameText.toggle()
                                            }
                                            
                                           
                                        }
                                        
                                        
                                        }
                                    
                                    //Second Screen
                                    if self.tutorialCounter == 2 {
                                        
                                        self.showPlayGame.toggle()
                                        self.showPlayGameText.toggle()
                                        
                                        withAnimation {
                                            
                                            self.showTutorial.toggle()
                                            
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showTutorialText.toggle()
                                            }
                                        }
                                        
                                    }
                                    
                                    //Third Screen
                                    if self.tutorialCounter == 3 {
                                        
                                        self.showTutorial.toggle()
                                        self.showTutorialText.toggle()
                                        
                                        withAnimation {
                                            
                                            self.showClickBeginGame.toggle()
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showClickBeginGameText.toggle()
                                            }
                                        }
                                    }
                                    
                                    //Fourth Screen
                                    if self.tutorialCounter == 4 {
                                        
                                        self.showClickBeginGame.toggle()
                                        self.showClickBeginGameText.toggle()
                                        
                                        withAnimation {
                                            self.showMemoriseNumber = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showMemoriseNumberText = true
                                            }
                                        }
                                    }
                                    
                                    //Fifth Screen
                                    if self.tutorialCounter == 5 {
                                        
                                        withAnimation {
                                            
                                            self.showClickOperators = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showClickOperatorsText = true
                                            }
                                        }
                                    }
                                    
                                    //Sixth Screen
                                    if self.tutorialCounter == 6 {
                                        
                                        withAnimation {
                                            
                                            self.showClickPlayNumbers = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showClickPlayNumbersText = true
                                            }
                                        }
                                    }
                                    
                                    //Seventh Screen
                                    if self.tutorialCounter == 7 {
                                        
                                        withAnimation {
                                            
                                            self.showStatisics = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showStatisicsText = true
                                            }
                                        }
                                    }
                                    
                                    //Eight Screen
                                    if self.tutorialCounter == 8 {
                                        
                                        withAnimation {
                                            
                                            self.showResetGame = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showResetGameText = true
                                            }
                                        }
                                    }
                                    
                                }) {
                                    
                                    Text("Next")
                                        .frame(width:80,height: 40)
                                        .background(Color.blue)
                                        .foregroundColor(Color.white)
                                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white,lineWidth: 2))
                                        
                                                                    
                                        
                                    
                                }
                            }
                    Spacer().frame(height:30)
                
                //How to play game
                if self.showPlayGame {
                    
                    VStack {
                    
                    Text("Click on Play Game to play")
                        .frame(width:300,height: 30,alignment: .leading)
                        .font(.custom("American Typewriter", size: 23))
                        .foregroundColor(Color.yellow)
                        
                        
                        Spacer().frame(height:40)
                        
                        GameImage(tutorialImage: "TutorialFront_PlayGame")
                        
                    }.transition(.move(edge: .bottom))
                }
                    
                //How to get help
                    if self.showTutorial {
                        
                        VStack {
                        
                        Text("For Help Click Tutorial")
                            .frame(width:300,height: 30,alignment: .leading)
                            .font(.custom("American Typewriter", size: 23))
                            .foregroundColor(Color.yellow)
                            
                            
                            Spacer().frame(height:40)
                            
                            GameImage(tutorialImage: "TutorialFront_Tutorial")
                            
                        }.transition(.move(edge: .bottom))
                    }
                    
                    //Begin Game
                    if self.showClickBeginGame {
                        
                       VStack {
                            
                            Text("Begin Game to Start")
                                .frame(width:300,height: 30,alignment: .leading)
                                .font(.custom("American Typewriter", size: 23))
                                .foregroundColor(Color.yellow)
                                
                                
                                Spacer().frame(height:40)
                                
                                GameImage(tutorialImage: "TutorialPlayGame_Instruction_One")
                                
                            }.transition(.move(edge: .bottom))
                        }
                    
                    //Memorise Number
                    if self.showMemoriseNumber {
                        
                        VStack {
                        
                        Text("Memorise Answer Number")
                            .frame(width:300,height: 30,alignment: .leading)
                            .font(.custom("American Typewriter", size: 23))
                            .foregroundColor(Color.yellow)
                            
                            
                            Spacer().frame(height:40)
                            
                            GameImage(tutorialImage: "TutorialPlayGame_Instruction_Two")
                            
                        }.transition(.move(edge: .bottom))
                        
                        
                        
                        
                    }
                    
                        
                        
                        
                        
                    
                    
                    
                    
                    
                    
                Spacer()
                }//VStack for Each page
        
            }//End of ZStack
        
        }//End VStack
        
        
        
        
    }
    
}





//Preview GameInstructions
struct GameInstructions_Preview: PreviewProvider {
    
    static var previews: some View {
        
        GameInstructions()
        
    }
}

//Struct for Tutorial Image
struct GameImage: View {
    
    var tutorialImage = ""
    
    
    var body: some View {
        
        Image(tutorialImage)
            .resizable()
            .frame(width:300,height: 500)
            .scaledToFill()
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
           
        
        
    }
}




