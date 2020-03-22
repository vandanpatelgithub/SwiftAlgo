import UIKit

func pancakeSort(arr: [Int]) -> [Int] {
    var arr = arr
    var currentMaxFlips = arr.count
    
    while currentMaxFlips > 0 {
        let reqiredFlips = requiredFlips(arr: Array(arr[0..<currentMaxFlips]))
        flip(arr: &arr, k: reqiredFlips)
        flip(arr: &arr, k: currentMaxFlips)
        currentMaxFlips -= 1
    }
    return arr
}

func requiredFlips(arr: [Int]) -> Int {
    if arr.count == 1 { return 0 }
    var currentMax = arr[0]
    var requiredFlips = 0
    
    for index in 1..<arr.count {
        if arr[index] > currentMax {
            currentMax = arr[index]
            requiredFlips = index + 1
        }
    }
    return requiredFlips
}

func flip(arr: inout [Int], k: Int) {
    if k <= arr.count {
        arr = arr[0..<k].reversed() + Array(arr[k..<arr.count])
    }
}
