//
//  ActorsView.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 09/09/2025.
//

import SwiftUI

struct ActorsView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct HomeView: View {
    @State private var text = ""
    let timer = Timer.publish(every: 0.1,
                              on: .main,
                              in: .common).autoconnect()
    let manger = RaceDataViewManger.instance
    let mangerActors = ActorsViewManger.instance
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            Text(text)
                .font(.largeTitle)
                .bold(true)
                .foregroundStyle(.blue)
        }
        .onReceive(timer) { _ in
            // with RaceData
            
            //            DispatchQueue.global(qos: .default).async {
            //                if let data = manger.getRandomData() {
            //                    DispatchQueue.main.async {
            //                        self.text = data
            //                    }
            //                }
            //            }
            
            // without RaceData
            
//            DispatchQueue.global(qos: .default).async {
//                manger.getRandomDataWithQueue { title in
//                    if let data = title {
//                        DispatchQueue.main.async {
//                            self.text = data
//                        }
//                    }
//                }
//            }
            
            // Using Actors
            Task {
                if let data = await mangerActors.getRandomData() {
                    await MainActor.run {
                        self.text = data
                    }
                }
            }
        }
    }
    
}

struct SearchView: View {
    @State private var text = ""
    let timer = Timer.publish(every: 0.1,
                              on: .main,
                              in: .common).autoconnect()
    let manger = RaceDataViewManger.instance
    let mangerActors = ActorsViewManger.instance

    var body: some View {
        ZStack {
            Color.mint.opacity(0.2)
            Text(text)
                .font(.largeTitle)
                .bold(true)
                .foregroundStyle(.blue)
        }
        .onReceive(timer) { _ in
            // with RaceData
            
            //            DispatchQueue.global(qos: .default).async {
            //                if let data = manger.getRandomData() {
            //                    DispatchQueue.main.async {
            //                        self.text = data
            //                    }
            //                }
            //            }
            
            
            // without RaceData
            
//            DispatchQueue.global(qos: .default).async {
//                manger.getRandomDataWithQueue { title in
//                    if let data = title {
//                        DispatchQueue.main.async {
//                            self.text = data
//                        }
//                    }
//                }
//            }
            
            // Using Actors
            Task {
                if let data = await mangerActors.getRandomData() {
                    await MainActor.run {
                        self.text = data
                    }
                }
            }
            
        }
    }
    
}

#Preview {
    ActorsView()
}
