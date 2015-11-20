//
//  ImagePreviewCell.swift
//  ImagePreview
//
//  Created by Tim van Steenis on 26/10/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import ImagePreview
import Alamofire

class ImagePreviewCell : UICollectionViewCell {
  
  struct ViewModel {
    let url: NSURL
    let preview: String
  }
  
  @IBOutlet private weak var imageView: UIImageView!
  
  var viewModel: ViewModel? {
    didSet {
 
      guard let viewModel = viewModel else {
        return imageView.image = nil
      }
      
      // set the preview image
      imageView.image = NSData(base64EncodedString: viewModel.preview, options: [])
        .flatMap { UIImage(body: $0)?.blurredImageWithRadius(0.4, tintColor: nil, saturationDeltaFactor: 1) }
      
      // load the actual image from url (with a small delay)
      let seconds = 0.5
      let when = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
      dispatch_after(when, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {

        request(.GET, viewModel.url).response() { [weak self] (request, response, data, error) in
          
          guard let data = data, image = UIImage(data: data) else {
            return print("Could not load image from url \(viewModel.url.absoluteString)")
          }
          
          let transition = CATransition()
          transition.duration = 0.5
          transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
          transition.type = kCATransitionFade
          transition.removedOnCompletion = true
          self?.imageView.layer.addAnimation(transition, forKey: nil)
          self?.imageView.image = image
        }
      }
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    viewModel = nil
  }
}
