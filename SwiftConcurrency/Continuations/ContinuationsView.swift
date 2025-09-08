//
//  ContinuationsView.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 08/09/2025.
//

import SwiftUI

struct ContinuationsView: View {
    @StateObject private var viewModel = ContinuationsViewModel()

    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            } else {
                Text("Loading...")
            }
        }
        .task {
           // await viewModel.getImage()
            // viewModel.getPlusImage()
            await viewModel.getPlusImage()
        }
    }
}

#Preview {
    ContinuationsView()
}
