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
            List {
                ForEach(viewModel.landmaks, id: \.id) { item in
                    HStack {
                        Image("\(item.imageName)")
                            .resizable()
                            .frame(minWidth: 120, minHeight: 80)
                            .scaledToFit()
                            .cornerRadius(12)

                        VStack(alignment: .leading) {
                            Text("\(item.name)")
                                .font(.headline)

                            Text("\(item.subtitle)")
                                .font(.callout)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 8)
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
