# QuotesDictionaryCreator

Scraping data from wisdomquotes.com to get a dictionary of over 34,000 quotes on your desktop.


```swift

open var QuotesDictionary: [String: [[String: Any]]] = [:]
    let url = URL(string: "https://wisdomquotes.com/")!
    
    init () {
        createQuoteDict()
    }
    
    /// Create a dictionary of quotes
    open func createQuoteDict() {
         let quoteLinks = getAllQuoteLinks()
         QuotesDictionary["results"] = []
        
         for (k, v) in quoteLinks {
             do {
                let data = try Data(contentsOf: v)
                let html = String(data: data, encoding: .utf8)!
                
                scrapeQuotes(html: html, type: k)
             } catch {
                 NSLog("Error: \(error)")
             }
         }

         writeJsonToFileOnDesktop()
}

```
