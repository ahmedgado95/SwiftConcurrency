//
//  AsyncAwaitView.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 24/08/2025.
//

import SwiftUI

struct AsyncAwaitView: View {
    @StateObject private var viewModel = AsyncAwaitViewModel()
    var body: some View {
        VStack{
            List {
                ForEach(viewModel.nameList, id: \.self) { item in
                    Text(item)
                }
            }
        }.onAppear {
            Task {
                await viewModel.fetchName()
                await viewModel.fetchSecondName()
            }
        }
    }
}

#Preview {
    AsyncAwaitView()
}
