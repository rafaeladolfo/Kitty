//
//  File.swift
//  
//
//  Created by Rafael Adolfo  on 17/02/22.
//

public protocol CatProvider {
    func fetchCats(withBreed breed: String, page: Int, completion: @escaping (Kitty?) -> Void)
}
