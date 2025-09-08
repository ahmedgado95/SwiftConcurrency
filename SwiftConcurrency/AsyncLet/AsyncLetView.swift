//
//  AsyncLetView.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 08/09/2025.
//

import SwiftUI

struct AsyncLetView: View {
    @State var images: [UIImage] = []
    @StateObject private var viewModel = AsyncLetViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.colunms) {
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle(" Async Let View ")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                Task{
                    do {
                        //  image will apper one by one
                        
                        //                         let image = try await viewModel.featchImages()
                        //                         let image1 = try await viewModel.featchImages()
                        //                         let image2 = try await viewModel.featchImages()
                        //                         let image3 = try await viewModel.featchImages()
                        //                         let image4 = try await viewModel.featchImages()
                        //
                        //                        images.append(image)
                        //                        images.append(image1)
                        //                        images.append(image2)
                        //                        images.append(image3)
                        //                        images.append(image4)
                        
                        
                        // image show at same time
                        
                        async let featchImage1 = viewModel.featchImages()
                        async let featchImage2 = viewModel.featchImages()
                        async let featchImage3 = viewModel.featchImages()
                        async let featchImage4 = viewModel.featchImages()
                        
                        let (image1,
                             image2,
                             image3,
                             image4) = await (try featchImage1,
                                              try featchImage2,
                                              try featchImage3,
                                              try featchImage4)
                        images.append(contentsOf: [image1,
                                                   image2,
                                                   image3,
                                                   image4])
                    }
                }
            }
        }
    }
}

#Preview {
    AsyncLetView()
}
