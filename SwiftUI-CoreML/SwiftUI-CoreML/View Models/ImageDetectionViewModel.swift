//
//  ImageDetectionViewModel.swift
//  SwiftUI-CoreML
//
//  Created by projas on 12/20/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageDetectionViewModel: ObservableObject {
  var name = ""
  var manager: ImageDetectionManager
  
  @Published var predictionLabel = ""
  
  init(manager: ImageDetectionManager) {
    self.manager = manager
  }
  
  func detect(_ name: String) {
    
    let sourceImage = UIImage(named: name)
    
    guard let resizedImage = sourceImage?.resizeImage(targetSize: CGSize(width: 224, height: 224)) else {
      fatalError("Unable to resize image")
    }
    
    if let label = self.manager.detect(resizedImage) {
      self.predictionLabel = label
    } else {
      self.predictionLabel = "Unknown"
    }
  }
}
