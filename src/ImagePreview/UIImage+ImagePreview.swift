//
//  UIImage+ImagePreview.swift
//  Pods
//
//  Created by Tim van Steenis on 26/10/15.
//
//

import Foundation
import UIKit

public struct ImagePreviewSettings {
  
  public static var sharedSettings: ImagePreviewSettings = ImagePreviewSettings()
  
  public var headers: [UInt8 : NSData] = [
    1 : NSData(base64EncodedString: "/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMgIyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCAMBIgACEQEDEQH/xAAfAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fo=", options: [])!
  ]
}

extension UIImage {
  
  public convenience init?(body: NSData) {
    guard body.length > 0 else { return nil }
    
    let versionLength = 1

    var buffer = [UInt8](count: 1, repeatedValue: 0)
    body.getBytes(&buffer, length: versionLength)
    
    guard let version = buffer.first else { return nil }
    guard let header = ImagePreviewSettings.sharedSettings.headers[version] else { return nil }
    
    let range = header.rangeOfData(NSData(bytes: [0xFF, 0xC0] as [UInt8], length: 2), options: [], range: NSRange(location: 0, length: header.length))
    guard range.location != NSNotFound else { return nil }
  
    let headerSizeIndexStart = range.location + 5

    let completeData = NSMutableData()
    let parts = [
      header.subdataWithRange(NSRange(location: 0, length: headerSizeIndexStart)),
      body.subdataWithRange(NSRange(location: versionLength, length: 4)),
      header.subdataWithRange(NSRange(location: headerSizeIndexStart, length: header.length - headerSizeIndexStart)),
      body.subdataWithRange(NSRange(location: 4 + versionLength, length: body.length - 4 - versionLength))
    ]
    parts.forEach(completeData.appendData)
    
    self.init(data: completeData)
  }  
}
