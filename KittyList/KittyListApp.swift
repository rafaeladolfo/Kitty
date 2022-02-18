//
//  KittyListApp.swift
//  KittyList
//
//  Created by Rafael Adolfo  on 17/02/22.
//

import SwiftUI

@main
struct KittyListApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: CatListViewModel(loader: CatService()))
        }
    }
}
