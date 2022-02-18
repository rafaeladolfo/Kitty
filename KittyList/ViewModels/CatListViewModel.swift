//
//  CatListViewModel.swift
//  KittyList
//
//  Created by Rafael Adolfo  on 17/02/22.
//

import Foundation
import CatAPIPackage

enum ViewState {
    case idle, loading, failed(Error), loaded(Kitty)
}

protocol CatProtocol {
    func load(catBreed: String, page: Int)
}

class CatListViewModel: CatProtocol, ObservableObject {
    // MARK: - Published vars
    @Published private(set) var state = ViewState.idle

    private let loader: CatService
    private var catList: Kitty = []

    init(loader: CatService) {
        self.loader = loader
    }
}

extension CatListViewModel {
    // MARK: - methods implementation
    func load(catBreed: String, page: Int) {
        state = .loading
        loader.load(catBreed: catBreed, page: page) { [weak self] cats in
            guard let self = self else { return }
            self.catList = cats
            self.state = .loaded(self.catList)
        }
    }
}
