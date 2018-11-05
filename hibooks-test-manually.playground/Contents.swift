import Foundation

// manually created map with all possible neighbors

let map: [[String]] = [["8"],
                        ["2", "4"],
                        ["1", "3", "5"],
                        ["2", "6"],
                        ["1", "5", "7"],
                        ["2", "4", "6", "8"],
                        ["3", "5", "9"],
                        ["4", "8"],
                        ["5", "7", "0", "9"],
                        ["6", "8"]]

// recursive method to take starting digit and n lenght that will return the final number with desired lenght

func hibooksWith(_ number: String, n: Int) -> String {
    
    let finalNumber = number
    
    func verify(_ lastNumber: Int) -> String {
        if let last = finalNumber.last, String(last) == String(lastNumber) {
            for i in map[lastNumber] {
                hibooksWith(finalNumber + i, n: n)
            }
            return finalNumber
        }
        return ""
    }
    
    if finalNumber.count == n {
        print(finalNumber)
        return finalNumber
    }
    
    for i in 0...map.count {
        verify(i)
    }
    
    return finalNumber
}

// call hibooks with starting digit and lenght
hibooksWith("1", n: 3)
