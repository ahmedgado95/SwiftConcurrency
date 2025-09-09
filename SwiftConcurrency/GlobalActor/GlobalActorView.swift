//
//  GlobalActorView.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 09/09/2025.
//

import SwiftUI

struct GlobalActorView: View {
    @StateObject private var viewModel = GlobalActorViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.numbers , id: \.self) {
                    Text($0)
                        .foregroundStyle(.red)
                }
            }
            .task{
                await viewModel.fetchNumbers()
            }
        }
    }
}

#Preview {
    GlobalActorView()
}
