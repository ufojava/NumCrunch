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
    
@State private var currentSign = ""
@State private var previousSign = ""

@State private var currentSignState = false
@State private var previousSignState = false
    
    
    
    func assignPrevious() -> String {
        
        var currentValue = ""
        
        if self.currentSignState {
            
            currentValue = self.currentSign
            
        }
        
        return currentValue
    }
    
    
    
    var body: some View {
        
        VStack {
            
        Text("Place Holder")
            
            
            Button(action: {
                
                self.currentSignState = true
                
                if self.currentSignState {
                    
                    self.currentSign = "+"
                }
                
                
            }) {
                
                
                Text("Update Me")
                
                
            }
            
      
            Text("\(self.currentSign)")
            /*
            Need to run my analysis prior to the update
            this can take the form of a bonus allocation 
            */
            Text("\(self.assignPrevious())")
    
         
           
            
        }
        
    }
    
    
}



struct DisplayPreviews: PreviewProvider {
    
    static var previews: some View {
        
        
        DisplayAlert()
    }
}
