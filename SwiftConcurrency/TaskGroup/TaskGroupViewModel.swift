//
//  TaskGroupViewModel.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 08/09/2025.
//

import Combine
import SwiftUI

class TaskGroupViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    let colunms = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    let manger = TaskGroupViewManger()
    
    func getImages() async {
        if  let image = try? await manger.featchImagesWithTaskGroup() {
            images.append(contentsOf: image)
        }
    }
}
