//
//  LandmaksViewModel.swift
//  Landmaks
//
//  Created by Md. Masud Rana on 5/27/24.
//

import Foundation

class LandmaksViewModel: LandmarkRepository, ObservableObject {
    @Published var uiState: UIState<[LandmaksResponse]> = .loading
    @Published var errorMessage: String? = nil

    private let repository: LandmarkRepositoryProtocol

    init(repository: LandmarkRepositoryProtocol = LandmarkRepository()) {
        self.repository = repository
    }

    func loadData() {
        uiState = .loading

        do {
            let landmarks = try repository.fetchLandmarks()
            uiState = .success(landmarks)
        } catch {
            uiState = .failure(error)
        }
    }
}

extension String: Identifiable {
    public var id: String { self }
}

enum UIState<T> {
    case loading
    case success(T)
    case failure(Error)
}
