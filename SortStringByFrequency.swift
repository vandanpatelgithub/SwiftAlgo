import UIKit

func frequencySort(_ s: String) -> String {
    var charDict = [Character: Int]()
    var output = ""
    
    for char in s {
        if charDict[char] != nil {
            charDict[char]! += 1
        } else {
            charDict[char] = 1
        }
    }
    
    let sortedDict = charDict.sorted { $0.value > $1.value }
    
    for (char, freq) in sortedDict {
        output += String(repeating: char, count: freq)
    }
    
    return output
}

frequencySort("tree")
