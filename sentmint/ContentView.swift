//
//  ContentView.swift
//  sentmint
//
//  Created by yara mohammed alqahtani on 12/06/1444 AH.
//

import SwiftUI
import NaturalLanguage







let backgroundGradient = LinearGradient(
    colors: [Color("color1"), Color("color3") ,Color("color1")],

    startPoint: .top,endPoint:.bottom)



struct DevTechieNLTaggerLemmaExample: View {
    
    init() {
      let navBarAppearance = UINavigationBar.appearance()
      navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "color2")]
      
    }
    
    
    
    
    @State var shouldPresentSheet = false
    @State private var inputString = ""
  
    @StateObject private var x = resultforsentmint()
    
    @State var result2 : Result = Result(title:  "That’s great!", description :" Be gratful for what you have♡", image: "n1" , qutoe: "Remember focus on the good things." )
//////
  
    let tagger = NLTagger(tagSchemes: [.language, .script, .tokenType,.sentimentScore])
    
//    let input =" "
//
//    let rangeLimit = NSRange(location: 0, length: input.count)
//    let range = Range(rangeLimit, in: input)
//    tagger.setLanguage(.arabic, range: range)
//
    var body: some View {
        
     
        
        NavigationStack {
            
            ZStack {
            backgroundGradient
            
                VStack {
                    
                    
                   
                    Text("How are you feeling today?")
                        .font(.custom("Sf", size: 24))
                        .foregroundColor(Color("color2"))
                    TextEditor(text: $inputString)
                        .cornerRadius(16)
                        .modifier(ClearButton(text: $inputString))
                        
                        .foregroundColor(Color.gray)
                        .font(.custom("HelveticaNeue", size: 16))
                        .frame(width: 320 ,height: 209)
                        .padding(40)
                        
                  
                    
                    ZStack{
                        
                        Rectangle()
                            .fill(Color("color2"))
                            .frame(width: 80, height: 40)
                            .cornerRadius(8)
                        Button(action: {
          
                          tagger.string = inputString
                                                let (sentiment, _) = tagger.tag(at: inputString.startIndex, unit: .paragraph, scheme: .sentimentScore)
                            
                            
                            result2 = x.normal()
            if let sentimentScore = Double(sentiment?.rawValue ?? "0") {
                                print(sentimentScore)
                        
                                if sentimentScore > 0.7 {
                                    result2 = x.happy()
                                } else if sentimentScore >= 0.0 {
                                    result2 = x.normal()
                                } else if sentimentScore > -0.7 {
                                    result2 = x.sadd()
                                } else {
                                    result2 = x.worried()
                                }
                          }
                            
                            shouldPresentSheet = true
                            
                            
                        }, label: {
                            Image(systemName: "arrow.up.heart.fill")
                                .font(.custom("HelveticaNeue", size: 33))
                                .foregroundColor(Color(.white))
                            
                                .sheet(isPresented: $shouldPresentSheet) {
                                    VStack{
                                        
                                   
                                            ResultView(result:result2)
                                    
                                        
                                    }
                                    
                                    .presentationDetents([.large, .medium, .fraction (0.75)])
                                }
                            
                        })
                        
                    }
            }
            .padding()
            .navigationTitle("Tameny")
            
            
            
        }
            .ignoresSafeArea()
        }
    }
}

struct DevTechieNLTaggerLemmaExample_Previews: PreviewProvider {
    static var previews: some View {
        DevTechieNLTaggerLemmaExample()
    }
}


struct Result{
    let title: String
    let description:String
    let image: String
    let qutoe:String
}

struct ResultView: View{
    let result: Result
    var body: some View{
        ZStack{
            Color("color2")
        VStack{
            Text(result.title).foregroundColor(.white).fontWeight(.bold )  .font(.custom("HelveticaNeue", size: 24))
                .padding(8)
            
            Text(result.description).foregroundColor(.white)
                .font(.custom("HelveticaNeue", size: 20))
             
            
            Image(result.image).resizable().frame(width: 250 , height: 250)
            
            Text(result.qutoe).foregroundColor(.white) .font(.custom("HelveticaNeue", size: 18))
            
        }.padding()
        .ignoresSafeArea()
    }
    }
}


struct ClearButton: ViewModifier
{
    @Binding var text: String

    public func body(content: Content) -> some View
    {
        ZStack(alignment: .trailing)
        {
            content

            if !text.isEmpty
            {
                Button(action:
                {
                    self.text = ""
                })
                {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}
