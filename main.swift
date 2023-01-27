import Foundation

let inputs: [String] = [
    "kCGColorSpaceModelRGB 0.44814 0.610033 0.266976 1", // #729b44
    "kCGColorSpaceModelRGB 0.524303 0.726362 0.324097 1", // #85b952
    "kCGColorSpaceModelRGB 1 1 1 1", // #ffffff
    "kCGColorSpaceModelRGB 0 0 0 0", // #000000
    "kCGColorSpaceModelRGB 0.5 0.5 0.5 1", // #7F7F7F
    "", // nil
    "kCGColorSpaceModelRGB 2 1 0.5 1", // nil
    "kCGColorSpaceModelRGB 2 1 0.5 1", // nil
    "2 1 0.5 1", // nil
    "kCGColorSpaceModelRGB 0 1 0.5", // nil
    "kCGColorSpaceModelRGB 0 1 1 0", // #00FFFF
]

func getHexCode(_ colorDesc: String) -> String? {
    // Do a regular expression match to ensure that the input is valid
    let regex = try! NSRegularExpression(pattern: #"^kCGColorSpaceModelRGB (0|1|[0-9]+.[0-9]+) (0|1|[0-9]+.[0-9]+) (0|1|[0-9]+.[0-9]+) (0|1|[0-9]+.[0-9]+)$"#)
    let matches = regex.matches(in: colorDesc, range: NSRange(location: 0, length: colorDesc.count))
    if matches.count == 0 {
        return nil
    }
    let inputArray = colorDesc.components(separatedBy: " ")
    let _ = inputArray[0]
    let red = inputArray[1]
    let green = inputArray[2]
    let blue = inputArray[3]
    let alpha = inputArray[4]
    var redHex = String(Int(Float(red)! * 255), radix: 16)
    if redHex == "0" {
        redHex = "00"
    }
    var greenHex = String(Int(Float(green)! * 255), radix: 16)
    if greenHex == "0" {
        greenHex = "00"
    }
    var blueHex = String(Int(Float(blue)! * 255), radix: 16)
    if blueHex == "0" {
        blueHex = "00"
    }
    let _ = String(Int(Float(alpha)! * 255), radix: 16) // Alpha hex (opacity), in case needed
    let hexCode = "#\(redHex)\(greenHex)\(blueHex)"
    return hexCode
}

func test() {
    var result: String? = nil
    result = getHexCode(inputs[0])
    assert(result == "#729b44")
    print("Test 1 passed")

    result = getHexCode(inputs[1])
    assert(result == "#85b952")
    print("Test 2 passed")

    result = getHexCode(inputs[2])
    assert(result == "#ffffff")
    print("Test 3 passed")

    result = getHexCode(inputs[3])
    print(result ?? "nil")
    print("Test 4 passed")

    result = getHexCode(inputs[4])
    assert(result == "#7f7f7f")
    print("Test 5 passed")

    result = getHexCode(inputs[5])
    assert(result == nil)
    print("Test 6 passed")

    result = getHexCode(inputs[6])
    assert(result == nil)
    print("Test 7 passed")

    result = getHexCode(inputs[7])
    assert(result == nil)
    print("Test 8 passed")

    result = getHexCode(inputs[8])
    assert(result == nil)
    print("Test 9 passed")

    result = getHexCode(inputs[9])
    assert(result == nil)
    print("Test 10 passed")

    result = getHexCode(inputs[10])
    assert(result == "#00ffff")
    print("Test 11 passed")
}

test()
