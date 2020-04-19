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
    
    @State private var alertOne = false
    @State private var alertTwo = false
    
    @State private var alertThree = ""
    
    
    var body: some View {
        
        VStack {
            
        Text("Place Holder")
            
            .onTapGesture {
                self.alertOne = true
                self.alertTwo = true
                
                self.alertThree = "Hello"
                
        }
       
            
            
            
            .alert(isPresented: $alertOne) {
            
            Alert(title: Text("Alert One"), message: Text("The First"), dismissButton: .default(Text("OK")))
        }
        
           
            //This section will project a differnt alert to the view
         
        
            if self.alertTwo {
                
                
                Text("\(self.alertThree)")
                
                  
                
            }
            
        }
        
    }
    
    
}



struct DisplayPreviews: PreviewProvider {
    
    static var previews: some View {
        
        
        DisplayAlert()
    }
}
