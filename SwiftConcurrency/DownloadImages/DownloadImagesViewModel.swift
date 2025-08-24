//
//  DownloadImagesViewModel.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 24/08/2025.
//

import Foundation
import UIKit
import Combine

class DownloadImagesViewModel : ObservableObject {
    
    @Published var image: UIImage? = nil
    var cancellables: Set<AnyCancellable> = []
    let manger = DownloadImagesManger()
    func fetchImage() {
        
        // image = UIImage(systemName: "photo")
        
        //        manger.downloadImages { [weak self] image, error in
        //            guard let self = self else { return }
        //            if let error = error {
        //                print(error.localizedDescription)
        //            }
        //            if let image = image {
        //                DispatchQueue.main.async {
        //                    self.image = image
        //                }
        //            }
        //        }
        
        
        manger.downloadImageWithCombine()
            .receive(on: DispatchQueue.main)
            .sink { _ in

            } receiveValue: { [weak self] image in
                guard let self = self else { return }
                self.image = image
                
            }
            .store(in: &cancellables)
        
    }
    
    func fetchImage() async {
       let  image = try? await manger.downloadImageWithAsync()

        await MainActor.run { [weak self] in
            self?.image = image
        }
    }

}
