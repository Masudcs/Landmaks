//
//  ContentView.swift
//  Landmaks
//
//  Created by Md. Masud Rana on 5/27/24.
//

import SwiftUI

struct LandmarksScreen: View {
    @StateObject private var viewModel = LandmaksViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                switch viewModel.uiState {
                    case .loading:
                        ProgressView("Loading...")
                            .accessibilityIdentifier("loading_view")

                    case .failure(let error):
                        Text("Failed to load data: \(error.localizedDescription)")
                            .foregroundColor(.red)
                            .accessibilityIdentifier("failer_view")

                    case .success(let landmarks):
                        if landmarks.isEmpty {
                            Text("There is no landmark")
                                .padding()
                                .accessibilityIdentifier("empty_landmark")
                        } else {
                            List {
                                ForEach(Array(landmarks.enumerated()), id: \.offset) { index, item in
                                    HStack {
                                        Image("\(item.getImageName())")
                                            .resizable()
                                            .frame(minWidth: 120, minHeight: 80)
                                            .scaledToFit()
                                            .cornerRadius(12)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))

                                        VStack(alignment: .leading) {
                                            Text("\(item.getName())")
                                                .font(.headline)

                                            Text("\(item.getSubtitle())")
                                                .font(.callout)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 8)
                                    }
                                    .accessibilityElement(children: .combine)
                                    .accessibilityIdentifier("item_\(index + 1)")
                                }
                            }
                        }
                }
            }
            .navigationTitle("Landmaks")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                viewModel.loadData()
            })
        }
    }
}

#Preview {
    LandmarksScreen()
}
