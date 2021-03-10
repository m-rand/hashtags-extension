extension String { 
    /// Returns an array of all hashtag string occurences without the hashtag symbol.
    /// Example:
    ///     let str = "Hey here are some hashtags: #swift, #swiftui and #objective-c"
    ///     print(str.hashtags)
    ///     // prints: ["swift", "swiftui", "objective-c"]
    var hashtags: [String] {
        if let regex = try? NSRegularExpression(pattern: "#[a-z0-9\\-]+", options: .caseInsensitive) {
            return regex.matches(in: self, range: NSRange(startIndex..<endIndex, in:self)).map {
                String(self[Range($0.range, in: self)!].lowercased().dropFirst())
            }
        }
        return []
    }
}
