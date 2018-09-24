import Foundation

if CommandLine.arguments.count != 2 {
    print("Invalid call. Expected:");
    print("\(CommandLine.arguments[0]) <inputfile.smp>")
    exit (-1)
}

let smpFileName = CommandLine.arguments[1]
print("Converting: \(smpFileName)")

if var contents = FileManager.default.contents(atPath: smpFileName) {
    for index in 0..<contents.count {
        contents[index] = contents[index] ^ 0x66
    }

    FileManager.default.createFile(atPath: smpFileName + ".mp3", contents: contents)
    print("Done.")
} else {
    print("Could not read \(smpFileName)")
}
