//
//  TaskGroupView.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 08/09/2025.
//

import SwiftUI

struct TaskGroupView: View {
    @StateObject private var viewModel = TaskGroupViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.colunms) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle(" Task Group View ")
            .navigationBarTitleDisplayMode(.large)
            .task {
                await viewModel.getImages()
            }
        }
    }
}

#Preview {
    TaskGroupView()
}
