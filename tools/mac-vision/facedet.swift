import Foundation
import Vision
import CoreImage

let args = CommandLine.arguments
guard args.count >= 2 else { print("usage: facedet <inDir>"); exit(1) }
let inDir = args[1]
let fm = FileManager.default
let files = try! fm.contentsOfDirectory(atPath: inDir).filter { $0.hasSuffix(".png") }.sorted()
for f in files {
    let url = URL(fileURLWithPath: inDir + "/" + f)
    guard let src = CIImage(contentsOf: url) else { continue }
    let req = VNDetectFaceRectanglesRequest()
    let handler = VNImageRequestHandler(ciImage: src, options: [:])
    try? handler.perform([req])
    guard let res = req.results else { print("\(f) none"); continue }
    var out = "\(f)"
    for o in res {
        let b = o.boundingBox   // origin bottom-left, normalized
        let x0 = b.minX, x1 = b.maxX
        let y0 = 1.0 - b.maxY, y1 = 1.0 - b.minY   // đổi sang gốc trên-trái
        out += String(format: "  [x %.3f-%.3f y %.3f-%.3f]", x0, x1, y0, y1)
    }
    print(out)
}
