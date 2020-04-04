import UIKit

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let wordSet = Set(wordDict)
    var wordBreak = Array(repeating: false, count: s.count + 1)
    wordBreak[0] = true

    for index1 in stride(from: 0, to: s.count, by: 1) {
        for index2 in stride(from: 0, through: index1, by: 1) {
            if wordBreak[index2] && wordSet.contains(getSubstring(from: index2, to: index1, string: s)) {
                wordBreak[index1 + 1] = true
            }
        }
    }
    return wordBreak[s.count]
}

func getSubstring(from: Int, to: Int, string: String) -> String {
    let start = string.index(string.startIndex, offsetBy: from)
    let end = string.index(string.startIndex, offsetBy: to)
    return String(string[start...end])
}
