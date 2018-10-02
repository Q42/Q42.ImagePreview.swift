//
//  UIImage+ImagePreview.swift
//  Pods
//
//  Created by Tim van Steenis on 26/10/15.
//
//

import Foundation
import UIKit
import ImageIO

public struct ImagePreviewSettings {

  public static var shared: ImagePreviewSettings = ImagePreviewSettings()

  public var headers: [UInt8 : Data] = [
    1 : Data(base64Encoded: "/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMgIyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCAMBIgACEQEDEQH/xAAfAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fo=", options: [])!,
    2 : Data(base64Encoded: "/9j/4AAQSkZJRgABAQAASABIAAD/4QBYRXhpZgAATU0AKgAAAAgAAgESAAMAAAABAAEAAIdpAAQAAAABAAAAJgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAHqADAAQAAAABAAAAFAAAAAD/7QA4UGhvdG9zaG9wIDMuMAA4QklNBAQAAAAAAAA4QklNBCUAAAAAABDUHYzZjwCyBOmACZjs+EJ+/8AAEQgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9sAQwAJCQkJCQkQCQkQFhAQEBYeFhYWFh4mHh4eHh4mLiYmJiYmJi4uLi4uLi4uNzc3Nzc3QEBAQEBISEhISEhISEhI/9sAQwELDAwSERIfEREfSzMqM0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tL/90ABAAC", options: [])!
  ]

  @available(*, unavailable, renamed: "shared")
  public static var sharedSettings: ImagePreviewSettings {
    fatalError()
  }
}

extension UIImage {

  public convenience init?(imagePreview body: Data) {
    guard body.count > 5 else { return nil }

    let bytes = body.bytes
    let version = bytes[0]
    let size = bytes[1...4]
    let rest = bytes.suffix(from: 5)

    guard let header = ImagePreviewSettings.shared.headers[version] else { return nil }
    guard let (header1, header2) = header.headerParts else { return nil }

    var data = Data()
    data.append(header1)
    data.append(contentsOf: size)
    data.append(header2)
    data.append(contentsOf: rest)

    self.init(data: data)
  }

  @available(*, unavailable, renamed: "init(imagePreview:)")
  public convenience init?(body: Data) {
    fatalError()
  }

  public func makeImagePreview() -> (Data, Data)? {
    guard
      let sourceData = self.jpegData(compressionQuality: 0.9),
      let imageSource = CGImageSourceCreateWithData(sourceData as CFData, nil)
    else { return  nil }

    let options: [NSString: Any] = [
      kCGImageSourceThumbnailMaxPixelSize: CGFloat(30),
      kCGImageSourceCreateThumbnailFromImageAlways: true
    ]

    guard
      let cgImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary?),
      let data = UIImage(cgImage: cgImage).jpegData(compressionQuality: 0.4)
    else { return  nil }

    return data.previewParts
  }
}

private extension Data {

  var bytes: [UInt8] {
    var bytes = [UInt8](repeating: 0, count: self.count)
    self.copyBytes(to: &bytes, count: self.count)

    return bytes
  }

  var headerParts: (Data, Data)? {
    guard let range = self.range(of: Data(bytes: [0xFF, 0xC0])) else { return nil }
    let sizeStart = range.lowerBound.advanced(by: 5)

    let header1 = self.subdata(in: self.startIndex ..< sizeStart)
    let header2 = self.subdata(in: sizeStart ..< self.endIndex)

    return (header1, header2)
  }

  var previewParts: (Data, Data)? {
    guard let rangeC0 = self.range(of: Data(bytes: [0xFF, 0xC0])) else { return nil }
    guard let rangeDA = self.range(of: Data(bytes: [0xFF, 0xDA])) else { return nil }

    let sizeStart = rangeC0.lowerBound.advanced(by: 5)
    let sizeEnd = sizeStart.advanced(by: 4)

    let header1 = self.subdata(in: self.startIndex ..< sizeStart)
    let header2 = self.subdata(in: sizeEnd ..< rangeDA.lowerBound)
    let header = header1 + header2


    let size = self.subdata(in: sizeStart ..< sizeEnd)
    let body2 = self.subdata(in: rangeDA.lowerBound ..< self.endIndex)
    let body = Data(bytes: [0x02]) + size + body2

    return (header, body)
  }
}
