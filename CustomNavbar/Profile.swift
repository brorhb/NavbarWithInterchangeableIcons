//
//  Profile.swift
//  CustomNavbar
//
//  Created by Bror Brurberg on 08/02/2023.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 10)

            List {
                Text("Placeholder Name")
                    .font(.title)

                Text("Placeholder Email")
                    .font(.subheadline)

                Text("Placeholder Phone Number")
                    .font(.subheadline)
            }
        }
        .navigationTitle("Profil")
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
