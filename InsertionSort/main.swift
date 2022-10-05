import Foundation

func readFile(filename:String) -> Array<Substring> {

    //Read in the file
    let contents = try! String(contentsOfFile: filename)

    //Split the file on endline (\n)
    let lines = contents.split(separator:"\n")

    print("Num words: \(lines.count)")

    return lines
}


func insertionSort(strings:Array<Substring>) -> [Substring] {
    var a = strings
    var totalSwaps = 0
    print("Pass: 0, Swaps: 0/0, Array: \(a)") 
    for x in 1..<a.count {
        var swaps = 0
        var y = x
        let temp = a[y]
        while y > 0 && temp.lowercased() < a[y - 1].lowercased() {
            a[y] = a[y - 1]                // 1
            y -= 1
            swaps = swaps + 1
            totalSwaps = totalSwaps + 1
        }
        a[y] = temp                      // 2
        print("Pass: \(x), Swaps: \(swaps)/\(totalSwaps), Array: \(a)")
    }
    return a
}

var filename = "random.txt"
var strings = readFile(filename:filename)
let sortedArray = insertionSort(strings:strings)
//print("Array: \(sortedArray)")
