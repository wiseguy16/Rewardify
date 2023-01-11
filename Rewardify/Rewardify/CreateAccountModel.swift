//
//  CreateAccountModel.swift
//  Standups
//
//  Created by GWE48A on 1/10/23.
//

import SwiftUI
import SwiftUINavigation
import XCTestDynamicOverlay

class CreateAccountModel: ObservableObject {
  @Published var focus: CreateAccountView.Field?
  @Published var newUser: User
  var onCreateMyAccountTapped: () -> Void = unimplemented("CreateAccountView.onCreateMyAccountTapped")
  
  init(focus: CreateAccountView.Field? = .email, newUser: User) {
    self.focus = focus
    self.newUser = newUser
  }
  
  func newUserTappedReturn() {
    if newUser.email.isEmpty {
      self.focus = .email
    } else if newUser.password.isEmpty {
      self.focus = .password
    }
  }
  
}
