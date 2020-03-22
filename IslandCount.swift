import UIKit

let binaryMatrix = [ [0,    1,    0,    1,    0],
                     [0,    0,    1,    1,    1],
                     [1,    0,    0,    1,    0],
                     [0,    1,    1,    0,    0],
                     [1,    0,    1,    0,    1] ]

func getNumberOfIslands(binaryMatrix: [[Int]]) -> Int {
    var binaryMatrix = binaryMatrix
    var numIslands = 0
    let rows = binaryMatrix.count
    let columns = binaryMatrix[0].count
    
    for row in 0..<rows {
        for column in 0..<columns {
            if binaryMatrix[row][column] == 1 {
                numIslands += getNumberOfIslandsHelper(binaryMatrix: &binaryMatrix, row: row, column: column)
            }
        }
    }
    
    return numIslands
}

func getNumberOfIslandsHelper(binaryMatrix: inout [[Int]], row: Int, column: Int) -> Int {
    if !isValidRowIndex(index: row, matrix: binaryMatrix) || !isValidColumnIndex(index: column, matrix: binaryMatrix) || binaryMatrix[row][column] != 1 {
        return 0
    }
    binaryMatrix[row][column] = 0
    getNumberOfIslandsHelper(binaryMatrix: &binaryMatrix, row: row + 1, column: column)
    getNumberOfIslandsHelper(binaryMatrix: &binaryMatrix, row: row - 1, column: column)
    getNumberOfIslandsHelper(binaryMatrix: &binaryMatrix, row: row, column: column + 1)
    getNumberOfIslandsHelper(binaryMatrix: &binaryMatrix, row: row, column: column - 1)
    return 1
}

func isValidRowIndex(index: Int, matrix: [[Int]]) -> Bool {
    return index >= 0 && index < matrix.count
}

func isValidColumnIndex(index: Int, matrix: [[Int]]) -> Bool {
    return index >= 0 && index < matrix[0].count
}

getNumberOfIslands(binaryMatrix: binaryMatrix)
