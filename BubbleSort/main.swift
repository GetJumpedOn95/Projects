import Foundation
import CoreFoundation


// Add your code below:
func swap (strings:inout[Substring],firstIndex:Int,secondIndex:Int){
    let firstIndexValue = strings[firstIndex]
    let secondIndexValue = strings[secondIndex]

    strings[firstIndex] = secondIndexValue
    strings[secondIndex] = firstIndexValue
}


func readFile(filename:String) -> Array<Substring> {

    //Read in the file
    let contents = try! String(contentsOfFile: filename)

    //Split the file on endline (\n)
    let lines = contents.split(separator:"\n")

    print("Num words: \(lines.count)")

    return lines
}

func appendFile(filename:String, runTime:Double) {
  var contents : String = String(format: "%f", runTime)
  contents = contents + "\n"
  guard let data = contents.data(using:String.Encoding.utf8) else {return}
  let filePath = getDocumentsDirectory().appendingPathComponent(filename)
  print("writing \(contents) to \(filePath)")
  if let fileHandle = try? FileHandle(forWritingTo: filePath) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
}
}

func getDocumentsDirectory() -> URL {
  let fileURL: URL = URL(fileURLWithPath: "./")
  return fileURL
}

var numTimes = 300
var filename = "random.txt"
//Arrary of Substrings
var strings = readFile(filename:filename)
var totalCount = 0
var count = 0
var size = strings.count
var pass = 1
print("Pass: 0, Swaps: 0/0, Array: \(strings)")    

for x in 0...300 {
var startTime = CFAbsoluteTimeGetCurrent()
repeat {
    var index = 0
    count = 0
   
    repeat {
        index = index + 1
        let firstIndex:Int = index - 1
        let secondIndex:Int = index
        if(strings[secondIndex].lowercased() < strings[firstIndex].lowercased()){
            swap(strings:&strings, firstIndex:firstIndex, secondIndex:secondIndex)
            count = count + 1
            totalCount = totalCount + 1
        }
    } while (index + 1 < size)
    print("Pass: \(pass), Swaps: \(count)/\(totalCount), Array: \(strings)")

            pass = pass + 1
}while(count != 0)

let timeElapsed = (CFAbsoluteTimeGetCurrent() - startTime) * 1000 
print("Time Elapsed \(timeElapsed) ms")
appendFile(filename:"results.txt", runTime:timeElapsed)
print(x)
}
