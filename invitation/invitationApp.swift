//
//  invitationApp.swift
//  invitation
//
//  Created by 최태욱 on 2023/08/08.
//

import SwiftUI

@main
struct invitationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
