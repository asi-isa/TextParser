import Foundation
import NaturalLanguage

@main
struct App {
    static func main() {
        let text = CommandLine.arguments.dropFirst().joined(separator: " ")
        print(text)
        print()
        let sentiment = sentiment(for: text)
        print("Sentiment analysis: \(sentiment)")
    }
    
    static func sentiment(for string: String) -> Double {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = string
        
        let (sentiment, _) = tagger.tag(at: string.startIndex, unit: .paragraph, scheme: .sentimentScore)
        
        return Double(sentiment?.rawValue ?? "0") ?? 0
    }
}
