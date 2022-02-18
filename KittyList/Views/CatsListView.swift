//
//  CatsListView.swift
//  KittyList
//
//  Created by Rafael Adolfo  on 17/02/22.
//

import SwiftUI
import CatAPIPackage
import Kingfisher

struct CatsListView: View {
    @State var catList: Kitty
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(0..<catList.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            NavigationLink(catList[index].breeds![0].name! + " - " + catList[index].id!,
                                           destination: CatDetailView(model: Cat(name: catList[index].breeds![0].name!,
                                                                                 description: catList[index].breeds![0].breedDescription!,
                                                                                 imageUrl: catList[index].url!)))
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Awesome cats list")
            }
            .padding(.horizontal, 10)
        }
    }
}
