import Foundation
import Vision
import CoreImage
import AppKit

let args = CommandLine.arguments
guard args.count >= 3 else { print("usage: seg <inDir> <outDir>"); exit(1) }
let inDir = args[1], outDir = args[2]
let fm = FileManager.default
let files = try! fm.contentsOfDirectory(atPath: inDir).filter { $0.hasSuffix(".png") }.sorted()
let ctx = CIContext()
var done = 0
for f in files {
    let url = URL(fileURLWithPath: inDir + "/" + f)
    guard let src = CIImage(contentsOf: url) else { continue }
    let w = src.extent.width, h = src.extent.height
    let req = VNGeneratePersonSegmentationRequest()
    req.qualityLevel = .accurate
    req.outputPixelFormat = kCVPixelFormatType_OneComponent8
    let handler = VNImageRequestHandler(ciImage: src, options: [:])
    try? handler.perform([req])
    guard let buf = (req.results?.first)?.pixelBuffer else { continue }
    var mask = CIImage(cvPixelBuffer: buf)
    let sx = w / mask.extent.width, sy = h / mask.extent.height
    mask = mask.transformed(by: CGAffineTransform(scaleX: sx, y: sy))
    let outURL = URL(fileURLWithPath: outDir + "/" + f)
    try? ctx.writePNGRepresentation(of: mask, to: outURL,
        format: .L8, colorSpace: CGColorSpaceCreateDeviceGray())
    done += 1
    if done % 50 == 0 { print("\(done)/\(files.count)") }
}
print("XONG \(done)/\(files.count)")
