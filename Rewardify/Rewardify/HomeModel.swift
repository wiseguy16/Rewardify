//
//  HomeModel.swift
//  Standups
//
//  Created by GWE48A on 1/10/23.
//

import SwiftUI
import SwiftUINavigation
import XCTestDynamicOverlay

class HomeModel: ObservableObject {
  @Published var user: User
  var onLogoutTapped: () -> Void = unimplemented("HomeView.onLogoutTapped")
  
  init(user: User) {
    self.user = user
  }
  
}
