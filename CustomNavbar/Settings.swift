//
//  Settings.swift
//  CustomNavbar
//
//  Created by Bror Brurberg on 08/02/2023.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        Form {
            Section(header: Text("ACCOUNT")) {
                HStack {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                HStack {
                    Image(systemName: "lock.fill")
                    Text("Security")
                }
                HStack {
                    Image(systemName: "creditcard.fill")
                    Text("Payment")
                }
            }

            Section(header: Text("APPLICATION")) {
                HStack {
                    Image(systemName: "envelope.fill")
                    Text("Notifications")
                }
                HStack {
                    Image(systemName: "wrench.fill")
                    Text("General")
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
