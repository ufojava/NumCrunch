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
    
    
    var body: some View {
        
       
            
            NavigationView {
            
                    ZStack(alignment: .trailing) {
                    
                        Color(red: 0.2, green: 0.4, blue: 0.4).edgesIgnoringSafeArea(.all)
                        
                            .onAppear() {
                                
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    
                                    withAnimation {
                                        self.showGameBar = true
                                        
                                    }
                                    
                                }
                                
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    
                                    withAnimation {
                                        self.showLogo = true
                                        
                                    }
                                    
                                }
                               
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                    
                                    withAnimation {
                                        self.showTitleLabelNumber = true
                                    
                                        }
                                    
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                
                                    withAnimation {
                                    self.showTitleLabelFirst = true
                                    
                                
                                    }
                                    
                                }
                                    
                                    
                                    
                                    
                                
                                
                                  }//End onAppear
                        
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
    }
}
