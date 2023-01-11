//
//  RewardifyApp.swift
//  Rewardify
//
//  Created by Gregory Weiss on 1/11/23.
//

import SwiftUI

@main
struct RewardifyApp: App {
    var body: some Scene {
        WindowGroup {
          LoginView(loginModel: LoginModel(user: .blank))
        }
    }
}
