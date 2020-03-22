import UIKit

let input1 = "abcba"
let input2 = "cbbd"

func longestPalindrom(_ s: String) -> String {
    if s.isEmpty { return "" }
    
    var longestPalindromicString = String(s.first!)
    
    for (index, element) in s.enumerated() {
        let longestPalOdd = secretFunc(input: s, at: index, forOdd: true)
        let longestPalEven = secretFunc(input: s, at: index, forOdd: false)
        
        let currentPalOdd = longestPalOdd.0 + String(element) + longestPalOdd.1
        let currentPalEven = longestPalEven.0 + longestPalEven.1
        let currentLongestPal = currentPalOdd.count > currentPalEven.count ? currentPalOdd : currentPalEven
        
        if longestPalindromicString.count < currentLongestPal.count {
            longestPalindromicString = currentLongestPal
        }
    }
    return longestPalindromicString
}

func secretFunc(input: String, at index: Int, forOdd odd: Bool) -> (String, String) {
    var leftIndex = index - 1
    var rightIndex = odd ? index + 1 : index
    var leftPalindrome = ""
    var rightPalindrome = ""
    let array = Array(input)
    
    while leftIndex >= 0 && rightIndex < array.count {
        if array[leftIndex] == array[rightIndex] {
            leftPalindrome.insert(array[leftIndex], at: leftPalindrome.startIndex)
            rightPalindrome += String(array[rightIndex])
            leftIndex -= 1
            rightIndex += 1
        } else {
            return (leftPalindrome, rightPalindrome)
        }
    }
    return (leftPalindrome, rightPalindrome)
}

longestPalindrom(input1)
