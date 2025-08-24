//
//  DownloadImagesView.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 24/08/2025.
//

import SwiftUI

struct DownloadImagesView: View {
    @StateObject var viewModel = DownloadImagesViewModel()
    var body: some View {
        VStack{
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            
            Button("Download Image") {
                Task {
                    await viewModel.fetchImage()
                }
            }
        }
    }
}

#Preview {
    DownloadImagesView()
}
