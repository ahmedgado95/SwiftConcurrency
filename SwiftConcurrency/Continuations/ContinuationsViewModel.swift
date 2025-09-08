//
//  ContinuationsViewModel.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 08/09/2025.
//

import Combine
import SwiftUI

class ContinuationsViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let manger = ContinuationsViewManger()
    
    func getImage() async {
        guard let url = URL(string: "https://picsum.photos/1000") else { return }
        
        do {
          //  let data = try await manger.featchImage(url: url)
            let data = try await manger.featchImageWithContinuation(url: url)
            if let image = UIImage(data: data) {
                await MainActor.run {
                    self.image = image
                }
            }
            
        }
        catch
            {
            print("error \(error)")
        }
    }
    
    func getPlusImage() {
        manger.getSystemImage { [weak self] image in
            self?.image = image
        }
    }
    
    func getPlusImage() async {
        image = await manger.getSystemImageWithContinuation()
    }
}
