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
    
    
    
//Function to display message
    func tutoriaMessage() -> String {
        
        var message = ""
        
        
        if self.tutorialCounter >= 0 && self.tutorialCounter <= 10 {
            message = "Click Next for More"
            
            
        } else {
            
            message = "End. Next to Restart"
           
            
        }
        
        return message
    }
    
    
//Tutorial Counter
    @State private var tutorialCounter = 0
    
    var body: some View {
        
        
        VStack {
            
            ZStack(alignment: .top) {
        
                Color(red: 0.5, green: 0.3, blue: 0.4).edgesIgnoringSafeArea(.all)
                
                VStack {
                
                            HStack {
                                Text("\(self.tutoriaMessage())")
                                .frame(width:250,height: 30,alignment: .leading)
                                .font(.custom("American Typewriter", size: 23))
                                .foregroundColor(Color.white)
                                Spacer().frame(width:30)
                                
                                
                            
                            
                                Button(action: {
                                    
                                    
                                    
                                    
                                    if self.tutorialCounter >= 0 && self.tutorialCounter <= 10 {
                                    
                                    self.tutorialCounter += 1
                                        
                                    } else {
                                        
                                        self.tutorialCounter = 1
                                        //self.tutorialCounter += 1
                                    }
                                    
                                    //Play Game Option
                                    if self.tutorialCounter == 1 {
                                        
                                        self.showResetGame = false
                                        self.showResetGameText = false
                                        
                                        withAnimation {
                                            
                                            self.showPlayGame.toggle()
                                        

                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showPlayGameText.toggle()
                                            }
                                            
                                           
                                        }
                                        
                                        
                                        }
                                    
                                    //Tutorial Option
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
                                    
                                    //Cliock Begin Game
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
                                    
                                    //Memorise Random First Number
                                    if self.tutorialCounter == 4 {
                                        
                                        self.showClickBeginGame.toggle()
                                        self.showClickBeginGameText.toggle()
                                        
                                        withAnimation {
                                            self.showMemoriseNumber.toggle()
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showMemoriseNumberText.toggle()
                                            }
                                        }
                                    }
                                    
                                    //Number Pad
                                    if self.tutorialCounter == 5 {
                                        
                                        self.showMemoriseNumber.toggle()
                                        self.showMemoriseNumberText.toggle()
                                        
                                        withAnimation {
                                            
                                            self.showNumberPad.toggle()
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showNumberPadText.toggle()
                                            }
                                        }
                                    }
                                    
                                    //Number Digits
                                    if self.tutorialCounter == 6 {
                                        
                                        self.showNumberPad.toggle()
                                        self.showNumberPadText.toggle()
                                        
                                        withAnimation {
                                            
                                            self.showNumberDigits.toggle()
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showNumberDigitsText.toggle()
                                            }
                                        }
                                    }
                                    
                                    //Select Operators
                                    if self.tutorialCounter == 7 {
                                        
                                        self.showNumberDigits.toggle()
                                        self.showNumberDigitsText.toggle()
                                        
                                        withAnimation {
                                            
                                            self.showClickOperators.toggle()
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showClickOperatorsText.toggle()
                                            }
                                        }
                                    }
                                    
                                    //Play Numbers
                                    if self.tutorialCounter == 8 {
                                        
                                        self.showClickOperators.toggle()
                                        self.showClickOperatorsText.toggle()
                                        
                                        withAnimation {
                                            
                                            self.showClickPlayNumbers.toggle()
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showClickPlayNumbersText.toggle()
                                            }
                                        }
                                    }
                                    
                                    //Show Statistics
                                    if self.tutorialCounter == 9 {
                                        
                                        self.showClickPlayNumbers.toggle()
                                        self.showClickPlayNumbersText.toggle()
                                        
                                        withAnimation {
                                            
                                            self.showStatisics.toggle()
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                self.showStatisicsText.toggle()
                                            }
                                            
                                        }
                                        
                                    }//End Show Statisitcs
                                    
                                    //Reset Game
                                    if self.tutorialCounter == 10 {
                                        
                                        self.showStatisics.toggle()
                                        self.showStatisicsText.toggle()
                                        
                                        withAnimation {
                                            
                                            self.showResetGame.toggle()
                                            
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            self.showResetGameText.toggle()
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
                    
                    Group {
                
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
                                }//End of Group
                    
                    Group {
                    
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
                        
                        
                                
                                //Nuber Pad Entry UI
                               if self.showNumberPad {
                                    
                                    VStack {
                                        
                                        Text("Number Entry Pad")
                                            .frame(width:300, height:30,alignment: .leading)
                                            .font(.custom("American Typewriter", size: 23))
                                            .foregroundColor(Color.yellow)
                                        
                                        Spacer().frame(height:40)
                                        
                                         GameImage(tutorialImage: "TutorialPlayGame_Instruction_Three")
                                        
                                    }.transition(.move(edge: .bottom))
                                }
                                
                        
                        
                                //Show Number Digits
                                if self.showNumberDigits {
                                    
                                    
                                    VStack {
                                        
                                        Text("Number Format e.g 12 / 01")
                                            .frame(width:300, height:30,alignment: .leading)
                                                .font(.custom("American Typewriter", size: 23))
                                                .foregroundColor(Color.yellow)
                                            
                                            Spacer().frame(height:40)
                                        
                                        GameImage(tutorialImage: "TutorialPlayGame_Instruction_Four")
                                        
                                        
                                        
                                    }.transition(.move(edge: .bottom))
                                    
                                    
                                }
                        
                        
                        Group {
                            
                            //Show Click Operators
                            if self.showClickOperators {
                                
                                
                                VStack {
                                    
                                    Text("Select Operators +,-,*")
                                        .frame(width:300, height:30,alignment: .leading)
                                            .font(.custom("American Typewriter", size: 23))
                                            .foregroundColor(Color.yellow)
                                        
                                        Spacer().frame(height:40)
                                    
                                    GameImage(tutorialImage: "TutorialPlayGame_Instruction_Five")
                                    
                                    
                                    
                                }.transition(.move(edge: .bottom))
                                
                            }
                            
                            
                            
                            if self.showClickPlayNumbers {
                                
                                VStack {
                                
                                Text("Play Numbers")
                                    .frame(width:300, height:30,alignment: .leading)
                                        .font(.custom("American Typewriter", size: 23))
                                        .foregroundColor(Color.yellow)
                                    
                                    Spacer().frame(height:40)
                                
                                GameImage(tutorialImage: "TutorialPlayGame_Instruction_Six")
                                    
                                }.transition(.move(edge: .bottom))
                                
                            }
                            
                            
                            if self.showStatisics {
                                
                                VStack {
                                    
                                    Text("Game Play Stats")
                                        .frame(width:300, height:30,alignment: .leading)
                                            .font(.custom("American Typewriter", size: 23))
                                            .foregroundColor(Color.yellow)
                                        
                                        Spacer().frame(height:40)
                                    
                                    GameImage(tutorialImage: "TutorialPlayGame_Instruction_Seven")
                                    
                                    
                                    
                                }.transition(.move(edge: .bottom))
                            }
                            
                            if self.showResetGame {
                                
                                VStack {
                                    
                                    Text("Restart Game")
                                        .frame(width:300, height:30,alignment: .leading)
                                            .font(.custom("American Typewriter", size: 23))
                                            .foregroundColor(Color.yellow)
                                        
                                        Spacer().frame(height:40)
                                    
                                    GameImage(tutorialImage: "TutorialPlayGame_Instruction_Eight")
                                    
                                    
                                }.transition(.move(edge: .bottom))
                            }
                            
                        }//End of Group
                        
                        
                        
                        
                        
                        
                    }//VStack
                    
                    
                    
                    
                
                }// for Each page
                

                
               
                
                
                
             
                Spacer()
        
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




