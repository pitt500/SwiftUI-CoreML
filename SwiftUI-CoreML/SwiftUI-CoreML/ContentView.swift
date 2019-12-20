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
          
        }.padding()
          .background(Color.orange)
          .foregroundColor(Color.white)
        .cornerRadius(10)
        
        Text("Prediction")
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
