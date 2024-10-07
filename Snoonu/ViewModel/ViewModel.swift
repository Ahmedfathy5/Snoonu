//
//  ViewModel.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 23/09/2024.
//

import Foundation
import Combine
import UIKit

final class ViewModel: ObservableObject {
    @Published var dataModel: Resturant
    @Published var images: [String: UIImage] = [:]
    @Published var isLoading: Bool = false
   
    private var apiManager: ApiManagerType
    var cancelabel = Set<AnyCancellable>()
    
    init(apiManager: NetworkManager = NetworkManager(session: URLSession.shared), dataModel: Resturant) {
        self.apiManager = apiManager
        self.dataModel = dataModel
    }
    
    func fetchData()  {
        
        defer { isLoading = true }
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?a=Egyptian") else { return }
        apiManager.fetch(url: url)
            .decode(type: Resturant.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                        break
                case .failure(let error):
                    print("ther's big error here \(error)")
                }
            } receiveValue: { [weak self] data in
                self?.dataModel.meals = data.meals
                print("this is the data \(String(describing: data))")
            }
            .store(in: &cancelabel)
    }
    
    func downloadImages(for meals: [Meals]) {
        
        for meal in meals {
            guard let imageURL = URL(string: meal.mealImage) else { continue }
           
            URLSession.shared.dataTask(with: imageURL) { [weak self] data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.images[meal.mealImage] = image
                    }
                }
            }.resume()
        }
    }
    
}
