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
    @State private var questionAnswer = Int.random(in: 10...99)
    @State private var numberOne = ""
    @State private var numberTwo = ""
    
    //Operator Selector
    @State private var opratorSelectorMinu = false
    @State private var operatorSelectorPlus = false
    @State private var operatorSelectorMultiply = false
    
    
    var body: some View {
    
        VStack(alignment: .trailing, spacing: 100) {
        
        
            ZStack(alignment: .top) {
            
            //Background colour
        
            Color(red: 0.2, green: 0.5, blue: 0.4).edgesIgnoringSafeArea(.all)
            
            HStack {
                
                //Answer
                InputModule(numberFunction: "Answer", numberInput: String(self.questionAnswer))
                
                
                Spacer().frame(width:20)
                
                //Operator
                Text("=").font(.system(size: 30))
                
                Spacer().frame(width:20)
                
                //Numner 1
                InputModule(numberFunction: "Number 1", numberInput: self.numberOne)
                
                
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
                
                InputModule(numberFunction: "Number 2", numberInput: self.numberTwo)
                
                
                
                
                
                
                
                
            }//Hstack for Numners
            
            
            
            
            
        
       
        
           
            }
        
    }
    
    }
    
}

//Module used for Anwer, Numbers 1 & 2
struct InputModule: View {
    
    //Variables
    
    var numberFunction = ""

    @State public var numberInput = ""
    let characterLimit = 2
    
    
    
    
    var body: some View {
        
        //Inout Module
        ZStack(alignment: .bottom) {
        
        Rectangle()
            .frame(width:80,height: 100)
            .foregroundColor(Color.gray)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3))
            
            VStack {
                
                TextField("", text: $numberInput).multilineTextAlignment(.center)
                    .frame(width:30,height: 30)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 2))
                //TextField("", text: $numberInput).disabled(numberInput.count > (characterLimit - 1)) LIMIT TEXT FIELD
       
            
                
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
