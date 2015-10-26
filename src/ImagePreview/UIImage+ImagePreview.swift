//
//  UIImage+ImagePreview.swift
//  Pods
//
//  Created by Tim van Steenis on 26/10/15.
//
//

import Foundation
import UIKit

extension UIImage {
  
  public convenience init?(header: NSData, body: NSData) {
    guard header.length > 0 && body.length > 0 else { return nil }
    
    let range = header.rangeOfData(NSData(bytes: [0xFF, 0xC0] as [UInt8], length: 2), options: [], range: NSRange(location: 0, length: header.length))
    guard range.location != NSNotFound else { return nil }
    
    let headerSizeIndexStart = range.location + 5
    let versionLength = 1
    
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
