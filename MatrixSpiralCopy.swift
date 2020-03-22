import UIKit

let inputMatrix = [ [1, 2 ,3, 4],
                    [5, 6, 7, 8],
                    [9, 10, 11, 12] ]

func spiralCopy(inputMatrix: [[Int]]) -> [Int] {
    let numRows = inputMatrix.count
    let numColumns = inputMatrix[0].count
    var rowBegin = 0
    var rowEnd = numRows - 1
    var columnBegin = 0
    var columnEnd = numColumns - 1
    var result = [Int]()
    
    while rowBegin <= rowEnd && columnBegin <= columnEnd {
        for index in columnBegin...columnEnd {
            result.append(inputMatrix[rowBegin][index])
        }
        rowBegin += 1

        if rowBegin <= rowEnd {
            for index in rowBegin...rowEnd {
                result.append(inputMatrix[index][columnEnd])
            }
            columnEnd -= 1
        }
        
        if rowBegin <= rowEnd && columnBegin <= columnEnd {
            for index in (columnBegin...columnEnd).reversed() {
                result.append(inputMatrix[rowEnd][index])
            }
            rowEnd -= 1
        }
        
        if columnBegin <= columnEnd && rowBegin <= rowEnd {
            for index in (rowBegin...rowEnd).reversed() {
                result.append(inputMatrix[index][columnBegin])
            }
            columnBegin += 1
        }
    }
    return result
}

spiralCopy(inputMatrix: inputMatrix)
