//
//  TestBed.swift
//  NumCrunch
//
//  Created by Ufuoma Okoro on 19/04/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI



//The code here will test alerting

struct DisplayAlert:    View {
    

    
    
    //Set timer for game
       @State private var timerStatus = false
       @State private var timeMaxSeconds = 150
       @State private var gameTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    

    
    
    
    var body: some View {
        
        VStack {
            
            
            Button(action: {
                
                self.timerStatus.toggle()
                
            }) {
                
                
                Text("Start Timer")
                
                
            }
            
            
            
            
        Text("Place Holder")
            .onReceive(gameTimer) { time in
                
                if self.timerStatus  {
                    
                    self.timeMaxSeconds -= 1
                    
                } else {
                
                
                    
                    //self.gameTimer.upstream.connect().cancel()
                    
                }
                
            }
            
            Text("\(self.timeMaxSeconds)")
            
            
    
         
           
            
        }
        
    }
    
    
}



struct DisplayPreviews: PreviewProvider {
    
    static var previews: some View {
        
        
        DisplayAlert()
    }
}
