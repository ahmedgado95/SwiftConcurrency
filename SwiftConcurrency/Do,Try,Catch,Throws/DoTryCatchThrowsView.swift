//
//  DoTryCatchThrowsView.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 21/08/2025.
//

import SwiftUI

struct DoTryCatchThrowsView: View {
    @StateObject var viewModel = DoTryCatchThrowsViewModel()
    var body: some View {
        Text(viewModel.text)
            .frame(width: 200 , height: 200)
            .foregroundStyle(.black)
            .background(.green)
            .onTapGesture {
                viewModel.featchText()
            }
    }
}

#Preview {
    DoTryCatchThrowsView()
}
