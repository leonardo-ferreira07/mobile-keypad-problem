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

var builtNumbers: [String] = []
var count = 0

// recursive method to take starting digit and n lenght that will return the final number with desired lenght

func hibooksWith_(_ number: String, n: Int) -> String {
    
    let finalNumber = number
    
    func verify(_ lastNumber: Int) -> String {
        if let last = finalNumber.last, String(last) == String(lastNumber) {
            for i in map[lastNumber] {
                hibooksWith_(finalNumber + i, n: n)
            }
            return finalNumber
        }
        return ""
    }
    
    if finalNumber.count == n {
        builtNumbers.append(finalNumber)
        count += 1
        return finalNumber
    }
    
    for i in 0...map.count {
        verify(i)
    }
    
    return finalNumber
}

func hibooksWith(_ number: String, n: Int) {
    hibooksWith_(number, n: n)
    
    if count == builtNumbers.count {
        print(builtNumbers)
    }
    
    count = 0
    builtNumbers = []
}

// call hibooks with starting digit and lenght
hibooksWith("5", n: 1)
hibooksWith("1", n: 3)

