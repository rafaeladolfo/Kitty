//
//  LoadingView.swift
//  KittyList
//
//  Created by Rafael Adolfo  on 17/02/22.
//

import SwiftUI

struct LoadingView: View {
    @State private var opacity: Double = 0.25
    private let duration: Double = 0.9
    private let maxOpacity: Double = 1.0

    var body: some View {
        VStack(alignment: .leading) {
            Text("Cats")
                .padding(.top, 50)
            List {
                ForEach(0..<15) { _ in
                    VStack(alignment: .leading) {
                        Text("LoadingLoadingLoading")
                        Text("LoadingLoading")
                    }
                }
            }
            .listStyle(.plain)
            .redacted(reason: .placeholder)
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = maxOpacity
                }
            }
        }
        .padding(.horizontal, 10)
    }
}
