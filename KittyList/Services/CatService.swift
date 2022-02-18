//
//  CatService.swift
//  KittyList
//
//  Created by Rafael Adolfo  on 17/02/22.
//

import Foundation
import CatAPIPackage

class CatService {
    func load(catBreed: String, page: Int, completionHandler: @escaping (Kitty) -> Void) {
        CatAPI(session: .shared).fetchCats(withBreed: catBreed, page: page) { result in
            guard let model = result else { return }
            completionHandler(model)
        }
    }
}
