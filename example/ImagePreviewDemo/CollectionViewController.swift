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

      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img1.jpg")!,
          preview: "AQAUAB7/2gAMAwEAAhEDEQA/AILTR7wIu+KOOFgP9YMZ/wAR9K00tRY2/mCWBmRflQA456n7vP0rlrbQbxLEKNdhZmxiJHYgd8cAD8qtzRXNrY7JLgu4TOxlbHX35rGrjK0Ivlj/AF3Kp4enKSuzQuNOmuo2a3bzROdzskeAx9M9cVWPhaUY81VjJGfnIXNSafqKxRFZtUOnsQf3Uasx+p5wKzbjTLyeXdb3Fpf5HMhlcH8dxreGYYlUlJ07ee6/QylhaXtGuf5HNxKPvHJYAck1ZRyVVTyGz19u9FFK7CxFcSuYi7MSQ+0ZOeKYLuaIYVsdaKK6KTZnJI//2Q=="
      ),
      
      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img2.jpg")!,
        preview: "AQAOAB7/2gAMAwEAAhEDEQA/AOt1HWtK0u5jtb/UI4pGj3cAttGO5GcZ5xVefSNAubdrmO9t1jU7TIjKVB64Pb8K5y20jTIm3rBJtZccsM9PXFTSaVps67Y4GTrk8Zz29vzFc0c4pxelzollkpLVIsvKlvKILbVLPG7KLvXJI5zx06ViPqkVzJhdWtwBk524B5+lXX8P6f8AL5QmXaMAkrkfjjNQroNmCRI0uTzlAgz/AOO1ss+orW34HP8A2NUf2vxP/9k="
      ),
      
      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img3.jpg")!,
        preview: "AQATAB7/2gAMAwEAAhEDEQA/AG2GhCRQ1vZs4I2iOeYK/T0I/ka2NCuZrVXY6YhsnG1wuGJPPrz0zXN23ifVLu63/Z4EnYL86xBm7Y53D2p2oatrahPsmo2G903hrePD4AHU/iKpVrqzM+VLY7oXOn3NuskE+xEOXSeQKmOehxk9ulZd9f6VLessEts6qoyVuDtz3wDXl+pXOq3LkXlw8jng+Y+eT6DGB07VWVL0Sf6iNvlACluMetXGaTIk01a5NYoBaAjOflPU1dktYXCEpz04JFFFeTV0N2Uru0iEqAK2CxGN56fnWZcFoJ8Ru6gKONxooq6Mm92JH//Z"
      ),
      
      ImagePreviewCell.ViewModel(
        url: URL(string: "https://raw.githubusercontent.com/Q42/Q42.ImagePreview.swift/master/demo-resources/img4.jpg")!,
        preview: "AQATAB7/2gAMAwEAAhEDEQA/ALI1/wAMOoKa1Z9OhDA9PcVVudb0wofsjCc9iuMVyQ0rw5D0iupD/tT4/kKZIbGEf6JmMjpnn9a9j2mKS6HlqjSv1NybWxuBS3Xrzk//AFqmt9dszkzJJE3psDD8CK5OS6YdJgfbmnQ3MRz5s0hP+zgCppV8W3b8zSdGlb/IrRqHhVmySfeqbMdxGT1oorGTZ0WDJOM0vQ0UUoPUTP/Z"
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

