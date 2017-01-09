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
    let url: URL
    let preview: String
  }
  
  @IBOutlet fileprivate weak var imageView: UIImageView!
  
  var viewModel: ViewModel? {
    didSet {
 
      guard let viewModel = viewModel else {
        return imageView.image = nil
      }
      
      // set the preview image
      imageView.image = Data(base64Encoded: viewModel.preview, options: [])
        .flatMap { UIImage(imagePreview: $0)?.blurred(blurRadius: 0.4, tintColor: nil, saturationDeltaFactor: 1) }
      
      // load the actual image from url (with a small delay)
      DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {

        request(viewModel.url).response { [weak self] response in

          guard let data = response.data, let image = UIImage(data: data) else {
            return print("Could not load image from url \(viewModel.url.absoluteString)")
          }

          let transition = CATransition()
          transition.duration = 0.5
          transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
          transition.type = kCATransitionFade
          transition.isRemovedOnCompletion = true
          self?.imageView.layer.add(transition, forKey: nil)
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
