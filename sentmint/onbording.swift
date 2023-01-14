
import SwiftUI

struct OnBardingStep {
    let image: String
    let title: String
    let description: String
    

    
}

private let onBoardingSteps = [
    OnBardingStep(image:"p1", title: " ", description: " Welcome"),
    OnBardingStep(image:"p2",  title: "1- Type what your feeling in white box.", description: ""),
    OnBardingStep(image:"p3", title: " 2- you will get a message ", description: "After typing and clicking the button .")

]


struct onbording: View {
    @State var isCancel12 = false
    @State private var currentStep = 0
    
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    
    var body: some View {
        
        
        ZStack {
            
            backgroundGradient
            
            VStack {
                
                
                HStack{
                    Spacer()
                    Button(action: {
                        self.currentStep = onBoardingSteps.count - 1
                    }) {
                       
                    }
                }
                
                TabView(selection: $currentStep){
                    ForEach(0..<onBoardingSteps.count) { it in
                        
                        VStack {
                            
                            Image(onBoardingSteps[it].image)
                                .resizable()
                                .frame(width: 300)
                            
                            
                            Text(onBoardingSteps[it].title)
                                .font(.title)
                            .multilineTextAlignment(.center)
                                .bold()
                                .foregroundColor(Color("color2"))
                            
                            Text(onBoardingSteps[it].description)
                                .multilineTextAlignment(.center)
                               .padding(.horizontal, 32)
                            .padding(.top, 8)
                            .foregroundColor(Color("color2"))
                            
                        }
                        .tag(it)
                    }
                }.frame(width: 400, height: 600)
               .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack{
                    ForEach(0..<onBoardingSteps.count) {it in
                        
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 20, height:  10)
                                .cornerRadius(10)
                                .foregroundColor(Color("color2"))
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.bottom, 24)
                
                Button(action:{
                    if self.currentStep < onBoardingSteps.count - 1 {
                        self.currentStep += 1
                    } else {
                        isCancel12 = true
                    }
                    
                    
                }) {
                    Text(currentStep < onBoardingSteps.count - 1 ? "Next" : "Get started")
                        .padding(8)
                        .frame(width: 120, height: 44)
                        .background(Color("color2"))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                    
                }
                
            }.padding()
            .fullScreenCover(isPresented: $isCancel12){
                DevTechieNLTaggerLemmaExample()
                
            }
            
        
                
        }.ignoresSafeArea()
         
        }
    }
    


struct onbording_Previews: PreviewProvider {
    static var previews: some View {
        onbording()
    }
}

