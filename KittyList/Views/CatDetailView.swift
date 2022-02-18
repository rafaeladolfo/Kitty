//
//  CatDetailView.swift
//  KittyList
//
//  Created by Rafael Adolfo  on 17/02/22.
//

import SwiftUI
import Kingfisher

struct CatDetailView: View {
    var model: Cat
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        VStack {
            KFImage(URL(string: model.imageUrl))
                .resizable()
                .frame(width: 400, height: 500, alignment: .center)
            Text(model.description)
        }.navigationBarTitle("Breed name: " + model.name)
    }
}
