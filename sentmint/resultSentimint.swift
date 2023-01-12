//
//  resultSentimint.swift
//  sentmint
//
//  Created by yara mohammed alqahtani on 15/06/1444 AH.
//

import Foundation


class resultforsentmint :ObservableObject {
    
    
    func happy () -> Result{
        let happyArray: [Result] = [.init(title: "That’s amazing",  description :"Here’s a little reward for you♡" , image: "h1" , qutoe: "remember doing the little things make us the happiest." ),
                                    .init(title: "Fantastic! ", description :"You deserve happy things♡", image: "h2"  , qutoe: "Happiness is a mood, positivity is a mindset." ),]
       
        let randomElement = happyArray.randomElement()!
        return randomElement
        
    }
    
    
    func sadd () -> Result{
        let sadArray: [Result] = [.init(title: "Take a deep breath! ", description :"Here’s a reminder for you♡", image: "s1" , qutoe: " Falling down is part of life, getting back uo is living." ),
                                  .init(title: "You are strong! ", description :"Listen to this relaxing music♡", image: "s1" , qutoe: "You will be okay, It just takes some time to heal." ),]
       
        let randomElement = sadArray.randomElement()!
        return randomElement
    }
    
    func worried () -> Result{
        let worriedArray: [Result] = [.init(title: "Let it go! ", description :"Don’t listen to the negative voice inside your mind♡", image: "w1",  qutoe: "If it comes,let it if it goes, let it" ),
                                  .init(title: "You’ll be fine don’t worry!", description :"Listen to this relaxing music♡", image: "w" , qutoe: "Set peace of mind as your highest goal, and organize your life around it." ),]
       
        let randomElement = worriedArray.randomElement()!
        return randomElement
    }
    
    func normal () -> Result{
        let normalArray: [Result] = [.init(title: "That’s great!", description :" Be gratful for what you have♡", image: "n1" , qutoe: "Remember focus on the good things." ),
                                  .init(title: "It’s okay!", description :" Talk a little nicer to yourself today♡", image: "n2" , qutoe: "Daily reminder to smile, plan, do." ),]
       
        let randomElement = normalArray.randomElement()!
        return randomElement
    }

    
    
}
