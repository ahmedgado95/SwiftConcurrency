//
//  AsyncLetViewModel.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 08/09/2025.
//

import SwiftUI

class AsyncLetViewModel: ObservableObject {
    let colunms = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    
    func featchImages() async throws -> UIImage {
        do {
            let url = URL(string: "https://picsum.photos/1000")
            let ( date , res ) = try await URLSession.shared.data(from: url!, delegate: nil)
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
