//
//  sentimentscor.swift
//  sentmint
//
//  Created by yara mohammed alqahtani on 18/06/1444 AH.
//
import Foundation
import NaturalLanguage

class LanguageProcessor {

    private let tagger: NLTagger
    
    init(tagger: NLTagger) {
        self.tagger = tagger
    }
    
    func getSentimentScore(from sentenceString: String, language : NLLanguage = .english, sentimentScore: @escaping (Double?)->()) {
        
        guard let range = sentenceString.range(of: sentenceString) else {
            sentimentScore(nil)
            return
        }
        
        tagger.string = sentenceString
        tagger.setLanguage(language, range: range)
        tagger.enumerateTags(in: range,
                             unit: .paragraph,
                             scheme: .sentimentScore,
                             options: []) { (tag, range) -> Bool in
                                
                                let score = Double(tag?.rawValue ?? "")
                                sentimentScore(score)
                                return true
        }
    }
    func showSchema(for language: NLLanguage){
        let arSchemes = NLTagger.availableTagSchemes(for: .word, language: language)
        print("Schema available: ")
        print(arSchemes.map ({ $0.rawValue }))
    }
    
}
// EXAMPLES
let languageProcessor = LanguageProcessor(tagger: NLTagger(tagSchemes: [.sentimentScore]))
let sentence1 = "I love eating broccoli."
let sentence2 = "I don't like eating broccoli"
let sentence3 = "hola"
let sentence4 = "السلام عليكم"

//languageProcessor.getSentimentScore(from: sentence1) { sentimentScore in
//    print(sentimentScore) // 1.0 (most positive)
//}
//languageProcessor.getSentimentScore(from: sentence2, language: .english) { sentimentScore in
//    print(sentimentScore) // -0.8 (very negative)
//}
//
//languageProcessor.getSentimentScore(from: sentence3, language: .spanish) { sentimentScore in
//    print(sentimentScore)
//}
//languageProcessor.getSentimentScore(from: sentence4, language: .arabic) { sentimentScore in
//    print(sentimentScore)
//}
