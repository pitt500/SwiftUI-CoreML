//
//  ImageDetectionManager.swift
//  SwiftUI-CoreML
//
//  Created by projas on 12/20/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import CoreML
import UIKit

class ImageDetectionManager {
  let model = Resnet50()
  
  func detect(_ image: UIImage) -> String? {
    
    guard let pixelBuffer = image.toCVPixelBuffer(),
      let prediction = try? model.prediction(image: pixelBuffer) else {
      return nil
    }
    
    return prediction.classLabel
  }
}
