//
//  TaskView.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 03/09/2025.
//

import SwiftUI

struct TaskView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("CLICK ME!") {
                    TaskContainer()
                }
            }
        }
    }
}

struct TaskContainer: View {
    
    @StateObject private var viewModel = TaskViewModel()
//    @State private var fetchImageTask: Task<(), Never>? = nil
    
    var body: some View {
        VStack(spacing: 40) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            if let image = viewModel.image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
            await viewModel.fetchImage()
        }
//        .onDisappear {
//            fetchImageTask?.cancel()
//        }
//        .onAppear {
//            fetchImageTask = Task {
//                await viewModel.fetchImage()
//            }
//            Task {
//                print(Thread.current)
//                print(Task.currentPriority)
//                await viewModel.fetchImage2()
//            }
            
            
//            Task(priority: .high) {
////                try? await Task.sleep(nanoseconds: 2_000_000_000)
//                await Task.yield()
//                print("high : \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .userInitiated) {
//                print("userInitiated : \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .medium) {
//                print("medium : \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .low) {
//                print("low : \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .utility) {
//                print("utility : \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .background) {
//                print("background : \(Thread.current) : \(Task.currentPriority)")
//            }
            
            
//            Task(priority: .low) {
//                print("low : \(Thread.current) : \(Task.currentPriority)")
                
                
//                Task.detached {
//                    print("detached : \(Thread.current) : \(Task.currentPriority)")
//                }
//            }
            
            
            
            
            
//        }
    }
}

#Preview {
    TaskView()
}
