//
//  TaskGroupViewManger.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 08/09/2025.
//

import UIKit

class TaskGroupViewManger {
    
    func featchImagesWithAsynclet() async throws -> [UIImage] {
        // this is not better way if i have more image
        async let featchImage1 = featchImages()
        async let featchImage2 = featchImages()
        async let featchImage3 = featchImages()
        async let featchImage4 = featchImages()
        
        let (image1,image2,image3,image4) = try await (featchImage1,featchImage2,featchImage3,featchImage4)
        
        return [image1,image2,image3,image4]
    }
    
    func featchImagesWithTaskGroup() async throws -> [UIImage] {
        return try await withThrowingTaskGroup(of: UIImage?.self) { group in
            var images: [UIImage] = []
            for image in 0..<4 {
                group.addTask {
                    try? await self.featchImages()
                }
            }
            
            for try await image in group {
                if let image = image {
                    images.append(image)
                }
            }
            return images
        }
    }
    
    
    private func featchImages() async throws -> UIImage {
        guard let url = URL(string: "https://picsum.photos/1000") else {
            throw URLError(.badURL)
        }
        do {
            let ( date , res ) = try await URLSession.shared.data(from: url, delegate: nil)
            if let image = UIImage(data: date) {
                return image
            }else {
                throw URLError(.badServerResponse)
            }
        }catch {
            throw error
        }
        
    }

    
}
