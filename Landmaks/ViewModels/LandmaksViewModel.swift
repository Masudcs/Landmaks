//
//  LandmaksViewModel.swift
//  Landmaks
//
//  Created by Md. Masud Rana on 5/27/24.
//

import Foundation

class LandmaksViewModel: ObservableObject {
    @Published var landmaks: [LandmaksResponse] = []
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "landmarkData", withExtension: "json")
        else {
            print("Json file not found")
            return
        }

        let data = try? Data(contentsOf: url)
        let landmark = try? JSONDecoder().decode([LandmaksResponse].self, from: data!)
        landmaks = landmark!
    }
}
