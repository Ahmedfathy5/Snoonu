//
//  ImageService.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 23/09/2024.
//
import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    private var cancellable: AnyCancellable?
    
    func loadImage(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }

    // Cancel any ongoing download
    func cancel() {
        cancellable?.cancel()
    }
}
