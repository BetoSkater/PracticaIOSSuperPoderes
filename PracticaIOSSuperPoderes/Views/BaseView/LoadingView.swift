//
//  LoadingView.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView(label: {
            Text("Loading")
                .id(0)
        })
        .progressViewStyle(CircularProgressViewStyle(tint: .red))
        .foregroundColor(.red)
        .id(1)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
