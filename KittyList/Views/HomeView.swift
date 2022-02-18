//
//  HomeView.swift
//  KittyList
//
//  Created by Rafael Adolfo  on 17/02/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: CatListViewModel
    @State var currentPage: Int = 1
    let catBreed = "beng"

    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                Color.clear.onAppear {
                    viewModel.load(catBreed: catBreed, page: currentPage)
                }
            case .loading:
                LoadingView()
            case .loaded(let catList):
                CatsListView(catList: catList)

                Section(footer:
                            HStack(alignment: .center) {
                    Button("Previous page") {
                        if currentPage == 1 { return }
                        currentPage -= 1
                        viewModel.load(catBreed: catBreed, page: currentPage)
                    }
                    Button("Next page") {
                        currentPage += 1
                        viewModel.load(catBreed: catBreed, page: currentPage)
                    }
                }) {
                    EmptyView()
                }
            case .failed(let error):
                Text(error.localizedDescription)
            }
        }
    }
}
