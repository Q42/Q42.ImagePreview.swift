//
//  ViewController.swift
//  ImagePreview
//
//  Created by Tim van Steenis on 10/26/2015.
//  Copyright (c) 2015 Tim van Steenis. All rights reserved.
//

import UIKit
import ImagePreview

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  fileprivate var items: [ImagePreviewCell.ViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
      flowLayout.minimumInteritemSpacing = 0.0
      flowLayout.minimumLineSpacing = 0.0
    }
    
    collectionView?.register(UINib.init(nibName: "ImagePreviewCell", bundle: nil), forCellWithReuseIdentifier: "ImagePreviewCell")
    
    items = [

      // 1
      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img1.jpg")!,
        size: CGSize(width: 4157, height: 2811),
        preview: "AQAUAB7/2gAMAwEAAhEDEQA/AILTR7wIu+KOOFgP9YMZ/wAR9K00tRY2/mCWBmRflQA456n7vP0rlrbQbxLEKNdhZmxiJHYgd8cAD8qtzRXNrY7JLgu4TOxlbHX35rGrjK0Ivlj/AF3Kp4enKSuzQuNOmuo2a3bzROdzskeAx9M9cVWPhaUY81VjJGfnIXNSafqKxRFZtUOnsQf3Uasx+p5wKzbjTLyeXdb3Fpf5HMhlcH8dxreGYYlUlJ07ee6/QylhaXtGuf5HNxKPvHJYAck1ZRyVVTyGz19u9FFK7CxFcSuYi7MSQ+0ZOeKYLuaIYVsdaKK6KTZnJI//2Q=="
      ),

      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img1.jpg")!,
        size: CGSize(width: 4157, height: 2811),
        preview: "AgAUAB7/2gAMAwEAAhEDEQA/AK1rplzsDPtWNvXn8eK1TClnD5gdSwGMYOAOvp/OuOg0y2EARdQy5x8uMDPpyRV2X9xAEWbeygcHGOvbk1jVxNaMXyxKp0acmrs1ZdLmuU/0fLo53FgMAn9aoTaGIztmdEPozAVJFfWqRNDc3EkTkEFYx8oz+PNZcti0j7rae3kX1kBU/wAzzXTHF4nkTdP9fy2MXQpczXN+h//Q80jc5HA5qeKd2G04x6fSqsfb/PenwdR+P86m7FZCvNIYi2futioJ7yePhW6U5v8AUP8A7wqnddfxreDZDSP/2Q=="
      ),

      // 2
      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img2.jpg")!,
        size: CGSize(width: 8000, height: 3876),
        preview: "AQAOAB7/2gAMAwEAAhEDEQA/AOt1HWtK0u5jtb/UI4pGj3cAttGO5GcZ5xVefSNAubdrmO9t1jU7TIjKVB64Pb8K5y20jTIm3rBJtZccsM9PXFTSaVps67Y4GTrk8Zz29vzFc0c4pxelzollkpLVIsvKlvKILbVLPG7KLvXJI5zx06ViPqkVzJhdWtwBk524B5+lXX8P6f8AL5QmXaMAkrkfjjNQroNmCRI0uTzlAgz/AOO1ss+orW34HP8A2NUf2vxP/9k="
      ),

      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img2.jpg")!,
        size: CGSize(width: 8000, height: 3876),
        preview: "AgAOAB7/2gAMAwEAAhEDEQA/AOnuta0W2lFrcXG47ckxguAD2JGetQzW3heSL7StwigHbuBHUdsGueijsI2JEAweMZNWGjsp/wDliFA9Dz19ev61yrNop6JnVLLJNaivd2kZKQ3seEBIA7AdfasGS8tbn/l6CgcjKkf0rWa2sH+ZImUY4wx4x6VRmt9PCjzI2bn+8Rz+BrZZ3D+Uw/seT+0f/9k="
      ),

      // 3
      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img3.jpg")!,
        size: CGSize(width: 4256, height: 2832),
        preview: "AQATAB7/2gAMAwEAAhEDEQA/AG2GhCRQ1vZs4I2iOeYK/T0I/ka2NCuZrVXY6YhsnG1wuGJPPrz0zXN23ifVLu63/Z4EnYL86xBm7Y53D2p2oatrahPsmo2G903hrePD4AHU/iKpVrqzM+VLY7oXOn3NuskE+xEOXSeQKmOehxk9ulZd9f6VLessEts6qoyVuDtz3wDXl+pXOq3LkXlw8jng+Y+eT6DGB07VWVL0Sf6iNvlACluMetXGaTIk01a5NYoBaAjOflPU1dktYXCEpz04JFFFeTV0N2Uru0iEqAK2CxGN56fnWZcFoJ8Ru6gKONxooq6Mm92JH//Z"
      ),

      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img3.jpg")!,
        size: CGSize(width: 4256, height: 2832),
        preview: "AgAUAB7/2gAMAwEAAhEDEQA/AI7TSFdN8UG8c/LI4DcexH8jW5pcjQIXmtVMDDtzyOevXpXL2+vanPLuEaJIcfMFBPtzkUt9qOtrgWtxCCV3ZiXBxjHJ5qlVvozO1tjv9+mOizRyBUX7wlbA/DHJ/CsG9udOmnf7M0bKDxmQsPwzivLr2bUp5MXDlmz/ABHPv3HH0FRRi8DnMat7bsYq4zsyG01uf//Q4KGMJCCpPOD1+tWHijYjI7VEn+pX6D+tWW6j6VwT7gzLlhjYgnPOe5qlcFracrGxIwOpz2rRft9TWdqH/HyfoP5VVNtvUSP/2Q=="
      ),

      // 4
      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img4.jpg")!,
        size: CGSize(width: 4288, height: 2848),
        preview: "AQATAB7/2gAMAwEAAhEDEQA/ALI1/wAMOoKa1Z9OhDA9PcVVudb0wofsjCc9iuMVyQ0rw5D0iupD/tT4/kKZIbGEf6JmMjpnn9a9j2mKS6HlqjSv1NybWxuBS3Xrzk//AFqmt9dszkzJJE3psDD8CK5OS6YdJgfbmnQ3MRz5s0hP+zgCppV8W3b8zSdGlb/IrRqHhVmySfeqbMdxGT1oorGTZ0WDJOM0vQ0UUoPUTP/Z"
      ),

      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img4.jpg")!,
        size: CGSize(width: 4288, height: 2848),
        preview: "AgAUAB7/2gAMAwEAAhEDEQA/ALC6v4YYZW+i+nI/mKqXGqadj/RT5vuOlceun+Hoh92Vj7v/AIAVG5s4v+PU7frzXsOriEjzFRp36m9Jqg3ZWMe/NSpqlkVy4ZT6Yz+orkXuGHR/505JoSPmds+2BSpV8T/w5c6VM//Q8o+0OB2P51EZXxnNNPSmnp+Fd0mzCxOGLdaCSOlNT/GlaiDYmf/Z"
      )
      
    ]
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return collectionView.dequeueReusableCell(withReuseIdentifier: "ImagePreviewCell", for: indexPath) as! ImagePreviewCell
  }

  override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    (cell as! ImagePreviewCell).viewModel = items[indexPath.row]
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return collectionView.frame.size
  }
}

