//
//  SwiftUIView.swift
//  sentmint
//
//  Created by yara mohammed alqahtani on 21/06/1444 AH.
//

import SwiftUI


struct SwiftUIView: View {
    
    var body: some View {
        VStack{
            Button(action: {
               // playSound(key :"music")
            }) {
                Text("Play")
                    . foregroundColor (Color.green)
                    .font(.system (size: 32))
            }
        }
    }

    
    
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
