//
//  TaskViewModel.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 03/09/2025.
//

import Combine
import UIKit

class TaskViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil

    func fetchImage() async {
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        
        do {
            guard let url = URL(string: "https://picsum.photos/1000") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            await MainActor.run(body: {
                self.image = UIImage(data: data)
                print("IMAGE RETURNED SUCCESSFULLY!")
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage2() async {
        do {
            guard let url = URL(string: "https://picsum.photos/1000") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            await MainActor.run(body: {
                self.image2 = UIImage(data: data)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
}
