//
//  LandmarksRepository.swift
//  Landmaks
//
//  Created by Md. Masud Rana on 5/27/24.
//

import Foundation

protocol LandmarkRepositoryProtocol {
    func fetchLandmarks() throws -> [LandmaksResponse]
}

class LandmarkRepository: LandmarkRepositoryProtocol {
    func fetchLandmarks() throws -> [LandmaksResponse] {
        guard let url = Bundle.main.url(forResource: "landmarkData", withExtension: "json") else {
            throw NSError(domain: "LandmarkRepository", code: 404, userInfo: [NSLocalizedDescriptionKey: "JSON file not found."])
        }

        let data = try Data(contentsOf: url)
        let landmarks = try JSONDecoder().decode([LandmaksResponse].self, from: data)
        
        return landmarks
    }
}
