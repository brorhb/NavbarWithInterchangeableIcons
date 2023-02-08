//
//  NewsList.swift
//  CustomNavbar
//
//  Created by Bror Brurberg on 08/02/2023.
//

import SwiftUI

struct Article: Hashable {
    let title: String
    let subtitle: String
}

struct NewsList: View {
    var body: some View {
        List(0..<5) { index in
            NavigationLink(
                value: Article(
                    title: "Placeholder title \(index)",
                    subtitle: "Placeholder subtitle \(index)")
            ) {
                Rectangle().fill(Color.gray).frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("Placeholder title \(index)")
                    Text("Placeholder subtitle \(index)").font(.subheadline)
                }
            }
        }
        .navigationTitle("News")
    }
}

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
    }
}
