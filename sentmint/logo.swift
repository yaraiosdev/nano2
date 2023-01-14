//
//  logo.swift
//  sentmint
//
//  Created by yara mohammed alqahtani on 17/06/1444 AH.
//

import SwiftUI


 
 

 struct logo: View {
 @State private var isActive = false
 @State private var size = 0.8
 @State private var opacity = 0.5
 var body: some View {
 if isActive{
     onbording()
 }
 else{
 VStack{
 VStack{
 
 Image("logo")
 .resizable()
 .scaledToFit()
 .frame(width: 150)

         }
         .scaleEffect(size)
         .opacity(opacity)
         .onAppear{
             withAnimation(.easeIn(duration: 1.2)){
                 self.size = 0.9
                 self.opacity = 1.0
             }
         }
     }.frame( maxWidth: .infinity,  maxHeight:
             
        .infinity) .background(Color("color1"))
         .ignoresSafeArea()
     .onAppear{
         DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
             withAnimation{
                 self.isActive = true
                 
             }
         }
     }
 }
 }
 }

struct logo_Previews: PreviewProvider {
    static var previews: some View {
        logo()
    }
}
