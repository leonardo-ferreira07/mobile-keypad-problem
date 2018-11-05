import Foundation

let keypad = [["1", "2", "3"],
              ["4", "5", "6"],
              ["7", "8", "9"],
              ["*", "0", "#"]]

// method to create the map with all possible neighbors for each digit

func makeMap(_ keypad: [[String]]) -> [[String]] {
    var map: [[String]] = []
    
    func add(neighbor: String, to: [String]) -> [String] {
        var to = to
        if neighbor != "*" && neighbor != "#" {
            to.append(neighbor)
            return to
        }
        return to
    }
    
    for i in 0...3 {
        for j in 0...2 {
            if keypad[i][j] != "*" && keypad[i][j] != "#" {
                var array: [String] = []
                if i >= 1 {
                    array = add(neighbor: keypad[i-1][j], to: array)
                }
                if j >= 1 {
                    array = add(neighbor: keypad[i][j-1], to: array)
                }
                if i < 3 {
                    array = add(neighbor: keypad[i+1][j], to: array)
                }
                if j < 2 {
                    array = add(neighbor: keypad[i][j+1], to: array)
                }
                map.append(array)
            }
        }
    }
    
    let last = map.removeLast()
    map.insert(last, at: 0)
    return map
}

// call map creation
let map = makeMap(keypad)

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
