//
//  ContentView.swift
//  SwiftUI-CoreML
//
//  Created by projas on 12/20/19.
//  Copyright © 2019 projas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  let images = ["cat1", "dog", "mountains", "tree"]
  @State private var selectedImage = ""
  
  @ObservedObject private var imageDetectionVM: ImageDetectionViewModel
  private var imageDetectionManager: ImageDetectionManager
  
  init() {
    self.imageDetectionManager = ImageDetectionManager()
    self.imageDetectionVM = ImageDetectionViewModel(manager: imageDetectionManager)
  }
  
  var body: some View {
    NavigationView {
      VStack {
        ScrollView(.horizontal) {
          HStack {
            ForEach(images, id: \.self) { name in
              Image(name)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipped()
                .onTapGesture {
                  self.selectedImage = name
                }
              .border(Color.black, width: self.selectedImage == name ? 10 : 0)
            
            }
          }
        }
        
        Button("Detect") {
          self.imageDetectionVM.detect(self.selectedImage)
        }.padding()
          .background(Color.orange)
          .foregroundColor(Color.white)
        .cornerRadius(10)
        
        Text(self.imageDetectionVM.predictionLabel)
        .padding()
      }
      .navigationBarTitle("Core ML")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
