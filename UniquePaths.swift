import UIKit

func uniquePaths(rows: Int, columns: Int) -> Int {
    var matrix: [[Int]] = Array(repeating: Array(repeating: -1, count: columns), count: rows)
    
    for column in 0..<columns {
        matrix[0][column] = 1
    }
    
    for row in 0..<rows {
        matrix[row][0] = 1
    }
    
    for row in 1..<rows {
        for column in 1..<columns {
            let leftIndex = column - 1
            let upIndex = row - 1
            if isValidLeftIndex(index: leftIndex, matrix: matrix) && isValidUpIndex(index: upIndex, matrix: matrix) {
                matrix[row][column] = matrix[row][leftIndex] + matrix[upIndex][column]
            }
        }
    }
    return matrix[rows - 1][columns - 1]
}

func isValidLeftIndex(index: Int, matrix: [[Int]]) -> Bool {
    if index >= 0 && index < matrix[0].count {
        return true
    }
    return false
}

func isValidUpIndex(index: Int, matrix: [[Int]]) -> Bool {
    if index >= 0 && index < matrix.count {
        return true
    }
    return false
}

uniquePaths(rows: 3, columns: 7)
