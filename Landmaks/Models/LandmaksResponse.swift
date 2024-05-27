//
//  LandmaksResponse.swift
//  Landmaks
//
//  Created by Md. Masud Rana on 5/27/24.
//

import Foundation

struct LandmaksResponse: Codable {
    let name: String?
    let id: Int?
    let subtitle, imageName: String?
    
    func getName() -> String {
        return self.name ?? ""
    }
    
    func getID() -> Int {
        return self.id ?? 0
    }
    
    func getSubtitle() -> String {
        return self.subtitle ?? ""
    }
    
    func getImageName() -> String {
        return self.imageName ?? ""
    }
}
