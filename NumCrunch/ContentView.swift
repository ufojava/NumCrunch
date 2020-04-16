//
//  ContentView.swift
//  NumCrunch
//
//  Created by Ufuoma Okoro on 09/04/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    //Show Bar, Logo and Label
    @State private var showTitleLabelFirst = false
    @State private var showTitleLabelNumber = false
    @State private var showLogo = false
    @State private var showGameBar = false
    
    //Image place holder before intro
    @State private var introCountdown = true
    
    
    var body: some View {
        
       
            
            NavigationView {
            
                    ZStack(alignment: .trailing) {
                    
                        Color(red: 0.2, green: 0.4, blue: 0.4).edgesIgnoringSafeArea(.all)
                        
                            .onAppear() {
                                
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    
                                    withAnimation {
                                        self.showGameBar = true
                                        
                                    }
                                    
                                }
                                
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                    
                                    withAnimation {
                                        self.showLogo = true
                                        
                                    }
                                    
                                }
                               
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                    
                                    withAnimation {
                                        self.showTitleLabelNumber = true
                                    
                                        }
                                    
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                                
                                    withAnimation {
                                    self.showTitleLabelFirst = true
                                    
                                
                                    }
                                    
                                }
                                    
                                    
                                    
                                    
                                
                                
                                  }//End onAppear
                        
                        IntroCountdown()
                        
                                    ZStack(alignment: .center) {
                                        
                                        HStack {
                                                
                                            HStack {
                                                
                                                HStack {
                                                    
                                                    if self.showTitleLabelFirst {
                                                    Text("First")
                                                        .foregroundColor(Color.yellow)
                                                        .font(.custom("American Typewriter", size: 23))
                                                        .transition(.move(edge: .leading))
                                                        
                                                    }


                                                    Spacer().frame(width:0) //Space between label
                                                   
                                                    if self.showTitleLabelNumber {
                                                    
                                                    
                                                    Text("Number")
                                                        .foregroundColor(Color.red)
                                                        .font(.custom("American Typewriter", size: 23))
                                                        .transition(.move(edge: .leading))
                                                        
                                                        
                                                    }
                                                 
                                                }
                                                
                                                
                                                
                                                if self.showLogo {
                                                  
                                                    Image("Twisty")
                                                        .resizable()
                                                        .frame(width:100,height: 100)
                                                        .transition(.move(edge: .bottom))
                                                    
                                                }
                                            }//HStack for logo and label
                                            
                                            Spacer().frame(width:80)
                                            
                                            
                                            ZStack {
                                                
                                                if self.showGameBar {
                                        Rectangle()
                                            .frame(width:70,height:600)
                                            .foregroundColor(Color.init(red: 0.4, green: 0.5, blue: 0.4))
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                            .transition(.move(edge: .trailing))
                                            
                                            Text("P\nl\na\ny\n\nG\na\nm\ne")
                                                .foregroundColor(Color.white)
                                                .font(.custom("American Typewriter", size: 25))
                                                .transition(.move(edge: .trailing))
                                                
                                                }
 
                                            }//End of ZStack for Game Bar
                                            
                                        }//HStack for Logon and Playbar
                                        
                                        
                                    }//End of ZStack Bar
                                
                
                                //CallGame()
            
                        
                        }//End of Main ZStack
                
                        .navigationBarTitle(Text("Home 🏚"))
                
            
    }
           
            
    
        
        
        
    
}


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
       ContentView()
        
        //IntroCountdown()
    }
}



struct IntroCountdown: View {
    
    @State private var showCircleThree = true
    @State private var showCircleTwo = true
    @State private var showCircleOne = true
    
    
    
    var body: some View {
        
        
        
        ZStack {
            
            //Temp background
            Color(red: 0.2, green: 0.4, blue: 0.4).edgesIgnoringSafeArea(.all)
                .onAppear() {
                    
                 
                        
                        
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                
                            withAnimation {
                                
                            self.showCircleThree = false
                                
                            }
                        
                        
                    }//End Circle three
                    
                    
              
                        
                        
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            
                                withAnimation {
                                    
                                    
                            self.showCircleTwo = false
                                
                            }
                    
                        
                    }//End Circle two
                    
                    
                  
                        
                        
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            
                                withAnimation {
                            self.showCircleOne = false
                                
                            }
                        }
                        
    
            
                    
            }// Ens onAppear
            
            
            
            
            
            
                
                ZStack {
                        if self.showCircleOne {
                            
                            
                                Circle()
                                    .frame(width: 100,height: 100)
                                    .foregroundColor(Color.green).opacity(0.5)
                                    .overlay(Circle().stroke(Color.black,lineWidth: 2))
                                    .transition(.move(edge: .leading))
                                
                                
                                Text("1")
                                    .font(.system(size: 40))
                          
                           
                        }
                
                }
            
            
            
            ZStack {
                
                
                    if self.showCircleTwo {
                    
                            Circle()
                                .frame(width: 200,height: 200)
                                .foregroundColor(Color.blue).opacity(0.5)
                                .overlay(Circle().stroke(Color.black,lineWidth: 2))
                                .transition(.move(edge: .trailing))
                            
                            
                            Text("2")
                                .font(.system(size: 40))
                        
                        
                    }
                
            
            }
            
            
            ZStack {
                
                   if self.showCircleThree {
                    
                            Circle()
                                .frame(width: 300,height: 300)
                                .foregroundColor(Color.yellow).opacity(0.5)
                                .overlay(Circle().stroke(Color.black,lineWidth: 2))
                                .transition(.move(edge: .bottom))
                            
                         
                            
                            Text("3")
                                .font(.system(size: 40))
                       
                    }
            }
        }
        
        
        
    }
}
