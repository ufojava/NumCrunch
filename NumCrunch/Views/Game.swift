//
//  Game.swift
//  NumCrunch
//
//  Created by Ufuoma Okoro on 09/04/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Teh Numbers Game
import SwiftUI


struct CallGame: View {

    
    var body: some View {
        
        //NavigationView {
            
        
        Game()
        //DisplayAlert()
        
        //}
        
    }
    
}



//Call Game Preview
struct CallGame_Preview: PreviewProvider {
    
    static var previews: some View {
        CallGame()
       
        
        
    }
    
}

//The game starts here
struct Game: View {
    
    //Random answer, Numbers 1 and 2
    //@State private var questionAnswer = 0
    @State private var questionAnswer = Int.random(in: 20...70)
    
    //Numbers 1 and 2 fields
    @State private var fieldOneNumberOne = ""
    @State private var fieldOneNumberTwo = ""
    
    @State private var fieldTwoNumberOne = ""
    @State private var fieldTwoNumberTwo = ""
    
   //Get numbers 1 and 2 details
    @State private var getFieldOneNumbers = ""
    @State private var getFieldTwoNumbers = ""
    

    
    //Converted Numbers to Int
    @State private var convertNumberOne = 0
    @State private var convertNumberTwo = 0
    
    //Variable to hold added Numbers 1 and 2
    @State private var totalInputNumbers = 0
    
    //Correct Answer Counter and messages
    @State private var correctAnswerCounter = 0
    @State private var answerMsg = ""
    @State private var playerScore = 0
    @State private var playerBonus = 0
   
    
    //Monitor the number state
    @State private var numberInputComplete = false

    
    //Number Pad Click Counter
    @State private var playerClickCounter = 0
    
    //Operator Selector
    @State private var opratorSelectorMinu = false
    @State private var operatorSelectorPlus = false
    @State private var operatorSelectorMultiply = false
    
    //Operator Counter
    @State private var operatorPrevious = ""
   
    
    //Number Input Pad
    @State private var numberPad = ["0","1","2","3","4","5","6","7","8","9"]
    
    
    
    //Variable for Previous and Current random numbers
    @State private var previousNumber = 0
    @State private var currentNumber = 0
    
    
    //Game Alerts
    @State private var showBeginGameAlert = false //Ensure Begin play has been pressed
    @State private var showPlayNumbersAlert = false // Ensure the numbers are entered before play numbers is pressed
    @State private var showOperatorSelectionAlert = false //One operator must be selected before selecting digit 3
    @State private var showGameReset = false //Alert for game reset
    
    
    
    //Play backgound music
    @State private var playBackgroundMusic = true
    
    //Reset game
    @State private var clickResetGame = false
    
    //Set timer for game
    @State private var timerStatus = false
    @State private var timeMaxSeconds = 180
    @State private var gameTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //Change countdown time color
    @State private var showCountDownColorRed = false
    
    
    
   

    
    
    //Calculate total figure
    func convertStringToInt() {
        
        
        
        if self.playerClickCounter == 3 && self.fieldTwoNumberTwo != ""{
            
            //Convert Number One
            self.convertNumberOne = Int(getFieldOneNumbers) ?? 0
            
            
            //Convert Number Two
            self.convertNumberTwo = Int(getFieldTwoNumbers) ?? 0
            
            
            
        }
        
        
        
        
        
    }//End of convert
    
    
    //Function to calculate user inpus
    func calculateInput() {
        
        
        //Run convert function
        convertStringToInt()
        
        if self.opratorSelectorMinu {
            
         
            self.totalInputNumbers = self.convertNumberOne - self.convertNumberTwo
            
            
            
            
        } else if self.operatorSelectorPlus {
            
   
            self.totalInputNumbers = self.convertNumberOne + self.convertNumberTwo
            
     
          
            
        } else if self.operatorSelectorMultiply {
            
          
            self.totalInputNumbers = self.convertNumberOne * self.convertNumberTwo
            
           
            
            
            
        }
        
    }//End of operator
   
//Function to analyse Previous and Current numbers
    func correctIncorrectAnswer() {
        
        
        
        
        if self.numberInputComplete {
            
            if self.totalInputNumbers == self.previousNumber {
                
                //Get current numner
                self.currentNumber = self.questionAnswer
                
                self.answerMsg = "Correct "
                speakWord(word: "Correct")
                self.correctAnswerCounter += 1
                
            
                    
                    //Minus
                    if opratorSelectorMinu && self.operatorPrevious != "-" {
                        
                        //Score Breakdown - Basic Score
                        self.playerScore += 50
                        
                        
                        
                        //Memorise the previous entry
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            
                            self.operatorPrevious = "-"
                        }
                        
                        
                      //Plus
                    } else if operatorSelectorPlus && self.operatorPrevious != "+" {
                        
                        self.playerScore += 50
                        
                        //Memorise the previous entry
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            
                            self.operatorPrevious = "+"
                        }
                        
                    } else if operatorSelectorMultiply && self.operatorPrevious != "*" {
                        
                        self.playerScore += 50
                        
                        //Memorise the previous entry
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            
                            self.operatorPrevious = "*"
                        }
                        
                        
                    } else {
                        
                        self.playerScore += 10
                        
                        //Speak word
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                        speakWord(word: "You scored 10 from a possible 50. Try not to use the same operator together")
                        }
                    }
                    
                   
                
 
                            
            //Swap Numbers
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    
                    self.previousNumber = self.currentNumber
                    
                }
                
            } else {
                
                //Get current number
                self.currentNumber = self.questionAnswer
                
                self.answerMsg = "Incorrect "
                speakWord(word: "Incorrect")
                
                
                //Update the operator
                
                if opratorSelectorMinu {
                    
                    self.operatorPrevious = "-"
                    
                } else if operatorSelectorPlus {
                    
                    self.operatorPrevious = "+"
                    
                } else if operatorSelectorMultiply {
                    
                    self.operatorPrevious = "*"
                }
                
           
                //Swap Numbers
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    
                    self.previousNumber = self.currentNumber
                    
                }
                
            }
            
        }
        
    }//End CorrectIncorrectFunction
    
    //Funciton to reset game
    func resetGame() {
        
        //Reset Random Number
        self.questionAnswer = Int.random(in: 20...70)
        
        //Reset Digits 1 and 2
        self.fieldOneNumberOne = ""
        self.fieldOneNumberTwo = ""
        self.fieldTwoNumberOne = ""
        self.fieldTwoNumberTwo = ""
        
        //Reset get Numbers 1 & 2
        self.getFieldOneNumbers = ""
        self.getFieldTwoNumbers = ""
        
        //Reset Convert Numbers 1 & 2
        self.convertNumberOne = 0
        self.convertNumberTwo = 0
        
        //Reset Total number input
        self.totalInputNumbers = 0
        
        //Reset Answer Counter and Messages
        self.correctAnswerCounter = 0
        self.answerMsg = ""
        self.playerScore = 0
        self.playerBonus = 0
        
        //Reset Monitor number state
        self.numberInputComplete = false
        
        //Reset pad click counter
        self.playerClickCounter = 0
        
        //Reset operators
        self.opratorSelectorMinu = false
        self.operatorSelectorPlus = false
        self.operatorSelectorMultiply = false
        
        //Reset Previous & Current Numbers
        self.previousNumber = 0
        self.currentNumber = 0
        
        //Reset Game play alerts
        self.showBeginGameAlert = false
        self.showPlayNumbersAlert = false
        self.showOperatorSelectionAlert = false
    
        
        //Reset play background music
        self.playBackgroundMusic = true
        
        //Reset previous
        self.operatorPrevious = ""
        
        //Reset show ten Second visual
        self.showCountDownColorRed = false
        
        //Reset background music
        
        if playBackgroundMusic {
            stopAudioPlay()
            
        }
            
        //Start the background music
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                       
                       playAudioBackgroundMusic(soundFile: "FirstNumberBackground", type: "mp3")
                       
            }
        
        
    }//End Reset game
    
    //Player bonus added at the end of the game
    func addPlayerBonus(totalCorrectAnswer: Int) -> Int {
        
        var playerBonus = 0
        
        //50 Bonus points
        if totalCorrectAnswer >= 5 && totalCorrectAnswer <= 9 {
            
            playerBonus = 50
        
            
        //100 Bonus points
        } else if totalCorrectAnswer >= 10 && totalCorrectAnswer <= 14 {
            
            playerBonus = 100
            
        } else if totalCorrectAnswer >= 15 {
            
            playerBonus = 300
            
        } else {
            
            playerBonus = 0
        }
        
        
        return playerBonus
        
    }
    
    

    
    
    var body: some View {
    
        VStack(alignment: .trailing, spacing: 100) {
        
        
            ZStack(alignment: .top) {
            
            //Background colour
        
            Color(red: 0.4, green: 0.5, blue: 0.4).edgesIgnoringSafeArea(.all)
                
             
                .onAppear() {
                    
                               
                               playAudioBackgroundMusic(soundFile: "FirstNumberBackground", type: "mp3")
                    
                    
                        speakWord(word: "Memorise the answer before you Click begin.")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       
                        speakWord(word: "The 3 minute counter will commence once the begin button is clicked")
                        
                    }
                            
                            
                   
                }
                
            .onDisappear() {
                            
                            //Stop the Background Audio
                            stopAudioPlay()
                
                            //Stop the clock
                            self.gameTimer.upstream.connect().cancel()
                }
                
                VStack {
            
                            HStack {
                                
                                //Answer
                                InputModuleAnswer(numberFunction: "Answer", numberInput: String(self.questionAnswer))
                                
                                
                                
                                
                                Spacer().frame(width:20)
                                
                                //Operator
                                Text("=").font(.system(size: 30))
                                
                                Spacer().frame(width:20)
                                
                                //Numner 1
                                InputModule(numberFunction: "Number 1", numberInputOne: self.fieldOneNumberOne, numberInputTwo: self.fieldOneNumberTwo)
                                
                                
                                Spacer().frame(width:20)
                                
                                VStack {
                                    
                                    
                                    //Minus Button
                                    Button(action: {
                                        
                                                                            
                                            self.opratorSelectorMinu.toggle()
                                            
                                                                                        
                                            //Check other operators
                                            
                                            if self.operatorSelectorPlus == true {
                                                
                                                self.operatorSelectorPlus.toggle()
                                            }
                                            
                                            if self.operatorSelectorMultiply == true {
                                                
                                                self.operatorSelectorMultiply.toggle()
                                            }
                                        
                                       
                                        
                                    }) {
                                        
                                        if self.opratorSelectorMinu {
                                        
                                            formatOperator(operatorSymbol: "-")
                                                .background(Color.yellow)
                                        
                                        } else {
                                            
                                            formatOperator(operatorSymbol: "-")
                                        }
                                    }
                                    
                                   
                                    
                                    Spacer().frame(height:7)
                                    
                                    //Plus Button
                                    Button(action: {
                                        
                                   
                                        
                                                self.operatorSelectorPlus.toggle()
                                            
                                                
                                                //Check other operators
                                                if self.opratorSelectorMinu == true {
                                                    
                                                    self.opratorSelectorMinu.toggle()
                                                }
                                                
                                                if self.operatorSelectorMultiply == true {
                                                    
                                                    self.operatorSelectorMultiply.toggle()
                                                }
                                        
                           
                                        
                                        
                                    }) {
                                        
                                        if self.operatorSelectorPlus {
                                        
                                            formatOperator(operatorSymbol: "+")
                                            
                                            .background(Color.yellow)
                                            
                                        } else {
                                            
                                            formatOperator(operatorSymbol: "+")
                                            
                                        }
                                    }
                                    
                                    Spacer().frame(height:7)
                                    
                                    //Multiply Button
                                    Button(action: {
                                        
                                      
                                        
                                                self.operatorSelectorMultiply.toggle()
                                             
                                                
                                                //Check for other operators
                                                if self.opratorSelectorMinu == true {
                                                    
                                                    self.opratorSelectorMinu.toggle()
                                                }
                                                
                                                if self.operatorSelectorPlus == true {
                                                    
                                                    self.operatorSelectorPlus.toggle()
                                                }
                                            
                                        
                                     
                                        
                                    }) {
                                        
                                        if self.operatorSelectorMultiply {
                                            
                                        formatOperator(operatorSymbol: "*")
                                            .background(Color.yellow)
                                        
                                        } else {
                                            
                                            formatOperator(operatorSymbol: "*")
                                        }
                                    }
                                    
                                   
                                    }.font(.system(size: 30))
                                
                                Spacer().frame(width:20)
                                
                                //Number 2
                                
                                InputModule(numberFunction: "Number 2", numberInputOne: self.fieldTwoNumberOne, numberInputTwo: self.fieldTwoNumberTwo)
                               
                                
                            
                                
                                
                    }//Hstack for Numbers
                    
                    
                    
                    Spacer().frame(height:40)
                    
              HStack {
                    
                    ForEach(0..<numberPad.count) { num in
                            
                        Text("\(self.numberPad[num])")
                            .frame(width:30,height: 30)
                            .background(Color.gray)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                            
                            //On Tap Gesture
                            .onTapGesture {
                                
                                
                                //Data Entry for Number 1
                                if self.playerClickCounter == 0 && self.playerClickCounter <= 4 {
                                    
                                    self.fieldOneNumberOne = self.numberPad[num]
                                    
                                    self.playerClickCounter += 1
                                
                                //Data Entry for the field two
                                } else if self.playerClickCounter == 1 && self.playerClickCounter <= 4 {
                                    
                                    self.fieldOneNumberTwo = self.numberPad[num]
                                    
                                    self.playerClickCounter += 1
                                    
                                    //Assign Number 1 digits to state variable
                                    self.getFieldOneNumbers = self.fieldOneNumberOne + self.fieldOneNumberTwo
                                
                                //Data Entry for the Number two field one
                                } else if self.playerClickCounter == 2 && self.playerClickCounter <= 4 {
                                    
                                    self.fieldTwoNumberOne = self.numberPad[num]
                                    
                                    self.playerClickCounter += 1
                                    
                                    //Check for operator
                                    if self.opratorSelectorMinu == false && self.operatorSelectorPlus == false && self.operatorSelectorMultiply == false {
                                        
                                        self.showOperatorSelectionAlert.toggle()
                                    }
                                
                                //Data Entry for the Number two field two
                                } else if self.playerClickCounter == 3 && self.playerClickCounter <= 4 {
                                    
                                    self.fieldTwoNumberTwo = self.numberPad[num]
                                    
                                    //Assign Number 2 digits to state variable
                                    self.getFieldTwoNumbers = self.fieldTwoNumberOne + self.fieldTwoNumberTwo
                                    
                                    //Enter state of data inout
                                    self.numberInputComplete.toggle()
                                    
                                }//End if Else Statement
                                    
                                    
           
                        }//End OnTapGesture
                        
                            
                        
                    }
                
                .alert(isPresented: $showOperatorSelectionAlert) {
                        Alert(title: Text("Operator Alert"), message: Text("Select Operator"), dismissButton: .default(Text("OK"),action: {self.showOperatorSelectionAlert = false}))
                }
            }//End of NumberPad HStack
                   
                    
                    Spacer().frame(height:30)
                    
                    HStack {
                        
                        
                        Button(action: {
                            
                            self.timerStatus = true
                            
                        
                            
                            if self.fieldOneNumberOne == "" && self.fieldOneNumberTwo == "" && self.fieldTwoNumberOne == "" && self.fieldTwoNumberTwo == "" {
                                
                            self.previousNumber = self.questionAnswer
                                print(self.previousNumber)
                                
                                //Trigger random number after one second and store in current
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                                    
                                    self.questionAnswer = Int.random(in: 20...70)
                                    self.currentNumber = self.questionAnswer
                                    print(self.currentNumber)
                                    
                                    
                                }
                            }//End of condition
                            
                            
                            
                            
                            
                            
                        }) {
                            
                            Text("Begin Game")
                                .frame(width:150,height:30)
                                .background(Color.red)
                                .foregroundColor(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                            
                                
                                //Set the game timer
                                .onReceive(gameTimer) { time in
                                
                                    if self.timerStatus && self.timeMaxSeconds > 0{
                                    self.timeMaxSeconds -= 1
                                        
                                        //Ten secound countdown
                                        if self.timeMaxSeconds > 0 && self.timeMaxSeconds <= 10 {
                                            
                                            self.showCountDownColorRed = true
                                            playAudioFile(soundFile: "TenSecondCountDown", type: "mp3")
                                            
                                            //Stop background music
                                            stopAudioPlay()
                                            
                                        }
                                        
                                        //Stop countdown Audio
                                        if self.timeMaxSeconds == 0 {
                                            
                                            stopMainAudioPlay()
                                            
                                            speakWord(word: "Game Over")
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                
                                                speakWord(word: "You scored \(self.playerScore) points")
                                            }
                                            
                                            //Adding bonus score
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                            //Add the bonus points
                                                speakWord(word: "You got \(self.correctAnswerCounter) correct which gives you \(self.addPlayerBonus(totalCorrectAnswer: self.correctAnswerCounter)) bonus points")
                                                
                                                self.playerScore += self.addPlayerBonus(totalCorrectAnswer: self.correctAnswerCounter)
                                            }
                                            
                                            //Final Score including bonus
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                                                
                                                speakWord(word: "Your final score incuding any bonus \(self.playerScore)")
                                            }
                                            
                                        }
                                        
                                    }
                            }
                                
                                    
                                
                            
                            
                                
                            
                        }//End of Begin Button
                    
                    
                            Button(action: {
                                
                                
                                
                                //Check if the Begin Game has been pressed
                                if self.previousNumber == 0 {
                                    
                                    self.showBeginGameAlert.toggle()
                                    
                                }
                                
                                
                                if self.numberInputComplete {
                                    
                                    self.calculateInput()
                                    self.correctIncorrectAnswer()
                                    
                                   
                                    //Reset fields and answer
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        
                                        self.fieldOneNumberOne = ""
                                        self.fieldOneNumberTwo = ""
                                        self.fieldTwoNumberOne = ""
                                        self.fieldTwoNumberTwo = ""
                                        self.questionAnswer = Int.random(in: 20...70)
                                        
                                        
                                        //Reset the Number Pick Counter
                                        self.playerClickCounter = 0
                                    
                          
                                    }//End Delay
                                    
                                    self.numberInputComplete.toggle()
                                    
                                }
                                
                                           
                                
                                
                            }) {
                                
                                
                                Text("Play Numbers").foregroundColor(Color.white)
                                    .frame(width:130,height:30)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                
                                
                                
                            }
                                
                            
                            //Aler for Play Game button clicked before the begin game button
                            .alert(isPresented: $showBeginGameAlert) {
                                
                               Alert(title: Text("Begin Game"), message: Text("Click on Begin Game"), dismissButton: .default(Text("OK"),action: {self.showBeginGameAlert = false}))
                                }
                            
                           
                        
                    }
                    
                    Spacer().frame(height:30)
                 
                  
                    VStack {
                        
                        Text("Game Statistics").foregroundColor(Color.yellow)
                        Spacer().frame(height:30)
                            
                        
                        HStack {
                            
                        Text("Your Answer Is:")
                            .frame(width:260,height: 30,alignment: .leading)
                            
                            InTextField(inText: self.answerMsg)
                        
                        }
                        Spacer().frame(height:5)
                        
                        HStack {
                            
                        Text("Correct Answer Count:")
                            .frame(width:260,height: 30,alignment: .leading)
                        
                            InTextField(inText: "\(self.correctAnswerCounter) ")
                        }
                        
                        Spacer().frame(height:5)
                        HStack {
                            
                        Text("You Score is:")
                            .frame(width:260,height: 30,alignment: .leading)
                            
                            InTextField(inText: "\(self.playerScore) ")
                        }
                        
                        Spacer().frame(height:5)
                        HStack {
                        Text("Timer:")
                            .frame(width:260,height: 30,alignment: .leading)
                            
                            
                            if showCountDownColorRed == false {
                            
                                InTextField(inText: "\(self.timeMaxSeconds) ")
                            
                            } else {
                                
                                InTextFieldRed(inText: "\(self.timeMaxSeconds) ")
                            }
                                
                                
                                
                                
                            
                            
                        }
                        
                    }.font(.custom("Coutier", size: 20))
                 
                    Spacer().frame(height:50)
                    
                    //Button to Reset Game
                    Button(action: {
                        
                        self.showGameReset = true
                        self.clickResetGame = true
                        
                        self.resetGame()
                        
                        //Change ClickResetGame back to false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            
                            self.clickResetGame = false
                        }
                        
                    }) {
                        
                        
                        Text("Game Reset")
                            .frame(width:150,height: 30)
                            .background(Color.black)
                            .foregroundColor(Color.white)
                             .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white,lineWidth: 2))
                        
                            .alert(isPresented: $showGameReset) {
                                
                                Alert(title: Text("Reset Alert"), message: Text("Game is going to be reset"), dismissButton: .default(Text("OK"),action: {self.showGameReset = false}))
                        }
                        
                           
                    }
                }//End of VStack
            
            
                
                
       
        
           
            }//Main ZStack
            
            
        
    }//Main VStack
    
    }
    
}

//Module used for Anwer, Numbers 1 & 2
struct InputModule: View {
    
    //Variables
    
    var numberFunction = ""

    var numberInputOne = ""
    var numberInputTwo = ""
    let characterLimit = 1
    
    
    
    
    var body: some View {
        
        //Inout Module
        ZStack(alignment: .bottom) {
        
        Rectangle()
            .frame(width:80,height: 100)
            .foregroundColor(Color.gray)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3))
            
            VStack {
                
                HStack {
                    
                Text(numberInputOne)
                    .frame(width:30,height: 30)
                    .background(Color.white)
                    .foregroundColor(Color.blue)
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 2))
                    .disabled(numberInputOne.count > (characterLimit - 1))
                    
                    Spacer().frame(width:3)
                
                Text(numberInputTwo)
                    .frame(width:30,height: 30)
                    .background(Color.white)
                    .foregroundColor(Color.blue)
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 2))
                    .disabled(numberInputTwo.count > (characterLimit - 1))
                }
            
                
                Spacer().frame(height:25)
            
                    ZStack {
                        
                       
                        Rectangle()
                            .frame(width:80,height: 20)
                            .foregroundColor(Color.blue)
                            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.black,lineWidth: 2))
                            
                            Text(numberFunction).foregroundColor(Color.white).foregroundColor(Color.white).font(.system(size: 12)).bold()
                            
                    }//Label ZStack

            
            }//Label VStack
            
            
        }//Model ZStack
        
    }
}


struct InputModuleAnswer: View {
    
    //Variables
    
    var numberFunction = ""
    var numberInput = ""
    let characterLimit = 2
    
    
    
    
    var body: some View {
        
        //Inout Module
        ZStack(alignment: .bottom) {
        
        Rectangle()
            .frame(width:80,height: 100)
            .foregroundColor(Color.gray)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3))
            
            VStack {
                
                HStack {
                    
                Text(numberInput)
                    .frame(width:30,height: 30)
                    .background(Color.white)
                    .foregroundColor(Color.blue)
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 2))
                    .disabled(numberInput.count > (characterLimit - 1))
                    
                    Spacer().frame(width:3)
                
               
                }
                
                Spacer().frame(height:25)
            
                    ZStack {
                        
                       
                        Rectangle()
                            .frame(width:80,height: 20)
                            .foregroundColor(Color.blue)
                            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.black,lineWidth: 2))
                            
                            Text(numberFunction).foregroundColor(Color.white).foregroundColor(Color.white).font(.system(size: 12)).bold()
                            
                    }//Label ZStack

            
            }//Label VStack
            
            
       }//Model ZStack
        
    }
}


struct formatOperator: View {
    
    var operatorSymbol = ""
    
    var body: some View {
        
        
        Text(operatorSymbol)
            .frame(width:28,height: 28)
            .font(.system(size: 25))
            .foregroundColor(Color.black)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3))
        
    }
    
}

struct InTextField: View {
    
    var inText = ""
    
    
    var body: some View {
        
        Text(inText)
            .frame(width:100,height: 30,alignment: .trailing)
            .background(Color.green)
            .foregroundColor(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.black,lineWidth: 2))
        
        
        
    }
}

//Display red color for countdown
struct InTextFieldRed: View {
    
    var inText = ""
    
    
    var body: some View {
        
        Text(inText)
            .frame(width:100,height: 30,alignment: .trailing)
            .background(Color.green)
            .foregroundColor(Color.red)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.black,lineWidth: 2))
        
        
        
    }
}

