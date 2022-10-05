import Foundation

// Add your code below
func selectionSort(strings:Array<Substring>) -> Array<Substring> {
    var a = strings
    var totalSwaps = 0
    print("Pass: 0, Swaps: 0/0, Array: \(a)")
    for x in 0..<a.count-1 {
//        var swaps = 1
        let index = x
        var minIndex = index
        for y in index..<a.count {
            if (a[y].lowercased() < a[minIndex].lowercased()) {
                minIndex = y
            }
        }
        if (minIndex != index) {
            let minValue = a[minIndex]
            a[minIndex] = a[index]
            a[index] = minValue
           
        }
        totalSwaps = totalSwaps+1
            let pass = x + 1
            print("Pass: \(pass), Swaps: 1/\(totalSwaps), Array: \(a)")
        
    }
    return a
}


func readFile(filename:String) -> Array<Substring> {

    //Read in the file
    let contents = try! String(contentsOfFile: filename)

    //Split the file on endline (\n)
    let lines = contents.split(separator:"\n")

    print("Num words: \(lines.count)")

    return lines
}

//get the list of strings from user input
//var strings: Array<String> = readLines()
var filename = "random.txt"
//Arrary of Substrings
var strings = readFile(filename:filename)
var sortedArray = selectionSort(strings:strings)








































