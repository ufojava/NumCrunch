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
        
        NavigationView {
        
        Game()
        
        }
        
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
    @State private var questionAnswer = Int.random(in: 20...99)
    
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
    
    //Monitor the number state
    @State private var numberInputComplete = false

    
    //Number Pad Click Counter
    @State private var playerClickCounter = 0
    
    //Operator Selector
    @State private var opratorSelectorMinu = false
    @State private var operatorSelectorPlus = false
    @State private var operatorSelectorMultiply = false
    
    //Number Input Pad
    @State private var numberPad = ["0","1","2","3","4","5","6","7","8","9"]
    
    
    //Holders Previous and Current random numbers
    @State private var previousCurrentNumber: [Int] = []
    @State private var memoryArrayCounter = 0
    
    
    
   
    
    
    //Calculate total figure
    func convertStringToInt() {
        
        
        
        if self.playerClickCounter == 3 && self.fieldTwoNumberTwo != ""{
            
            //Convert Number One
            self.convertNumberOne = Int(getFieldOneNumbers) ?? 0
            //print(self.convertNumberOne)
            
            //Convert Number Two
            self.convertNumberTwo = Int(getFieldTwoNumbers) ?? 0
            //print(self.convertNumberTwo)
            
        }
        
        
        
        
    }//End of convert
    
    
    //Function to calculate user inpus
    func calculateInput() {
        
        
        //Run convert function
        convertStringToInt()
        
        if self.opratorSelectorMinu {
            
            self.totalInputNumbers = self.convertNumberOne - self.convertNumberTwo
            print(self.totalInputNumbers)
            
        } else if self.operatorSelectorPlus {
            
            self.totalInputNumbers = self.convertNumberOne + self.convertNumberTwo
            print(self.totalInputNumbers)
            
        } else if self.operatorSelectorMultiply {
            
            
            self.totalInputNumbers = self.convertNumberOne * self.convertNumberTwo
            print(self.totalInputNumbers)
            
            
            
        }
        
        //Append to Memory Array
        if self.memoryArrayCounter <= 2 {
        self.previousCurrentNumber.append(self.questionAnswer)
        
            //Add to the counter
            self.memoryArrayCounter += 1
            
        } else if memoryArrayCounter > 2 {
            
            self.previousCurrentNumber.removeSubrange(0..<2)
            
            self.memoryArrayCounter = 1
            
            self.previousCurrentNumber.append(self.questionAnswer)
            
            //Add to the counter
            self.memoryArrayCounter += 1
            
           
            
           
        }
        
        
    
        if previousCurrentNumber.indices.contains(0) && previousCurrentNumber.indices.contains(1) && self.memoryArrayCounter < 3 {
        
        print(self.previousCurrentNumber[0])
        print(self.previousCurrentNumber[1])
        print(self.memoryArrayCounter)
            
        } else {
            
            print("No Records found")
        }
        
    }
    
    
    //Calculate Correct answer
    func correctAnswer() {
        
        if previousCurrentNumber.indices.contains(1) {
        
        let correctRandomNumber = self.previousCurrentNumber[1]
            
            
            if self.totalInputNumbers == correctRandomNumber {
                       
                       print("Correct Number")
                   } else {
                       
                       print("Incorrect Number")
                   }
        
        } else {
            
            
            print("Record not found")
        }
        
        
       
        
        
        
    }
    
    
    var body: some View {
    
        VStack(alignment: .trailing, spacing: 100) {
        
        
            ZStack(alignment: .top) {
            
            //Background colour
        
            Color(red: 0.4, green: 0.5, blue: 0.4).edgesIgnoringSafeArea(.all)
                
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
            }//End of NumberPad HStack
                   
                    
                    Spacer().frame(height:30)
                    
                    HStack {
                        
                        
                        Button(action: {
                            
                            self.previousCurrentNumber.append(self.questionAnswer)
                            self.questionAnswer = Int.random(in: 20...99)
                            
                            
                            
                        }) {
                            
                            Text("Begin Game")
                                .frame(width:150,height:40)
                                .background(Color.red)
                                .foregroundColor(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                            
                        }
                    
                    
                            Button(action: {
                                
                                if self.numberInputComplete {
                                    
                                    self.calculateInput()
                                    
                                    self.correctAnswer()
                                    
                                    
                                    
                                    //Reset fields and answer
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        
                                        self.fieldOneNumberOne = ""
                                        self.fieldOneNumberTwo = ""
                                        self.fieldTwoNumberOne = ""
                                        self.fieldTwoNumberTwo = ""
                                        self.questionAnswer = Int.random(in: 20...99)
                                        
                                        
                                        //Reset the Number Pick Counter
                                        self.playerClickCounter = 0
                                    
                          
                                    }
                                    
                                    self.numberInputComplete.toggle()
                                    
                                }
                                
                                
                                
                            }) {
                                
                                
                                Text("Play Numbers").foregroundColor(Color.black)
                                    .frame(width:130,height:40)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
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
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 2))
                    .disabled(numberInputOne.count > (characterLimit - 1))
                    
                    Spacer().frame(width:3)
                
                Text(numberInputTwo)
                    .frame(width:30,height: 30)
                    .background(Color.white)
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
