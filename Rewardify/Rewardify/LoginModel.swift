//
//  LoginModel.swift
//  Standups
//
//  Created by GWE48A on 1/10/23.
//

import SwiftUI
import SwiftUINavigation

class LoginModel: ObservableObject {
  @Published var destination: Destination? {
    didSet {
      bind()
    }
  }
  @Published var focus: LoginView.Field?
  @Published var user: User
  
  init(focus: LoginView.Field? = .email, user: User) {
    self.focus = focus
    self.user = user
  }
  
  enum Destination {
    case home(HomeModel)
    case resetPassword
    case createNewAccount(CreateAccountModel)
    case dontHaveRewards
    case alert(AlertState<AlertAction>)
  }
  
  enum AlertAction {
    case takeToCreateAccount
    case callSupport
    case dismiss
  }
  
  func userTappedReturn() {
    if user.email.isEmpty {
      self.focus = .email
    } else if user.password.isEmpty {
      self.focus = .password
    } else if user.rewardsNumber.isEmpty {
      self.focus = .rewards
    }
  }
  
  func submitButtonTapped() {
    self.destination = .home(HomeModel(user: self.user))
  }
  
  func createNewAccountTapped() {
    self.destination = .createNewAccount(CreateAccountModel(newUser: User.blank))
  }
  
  func newAccountCancelTapped() {
    self.destination = nil
  }
  
  private func bind() {
    switch destination {
    case let .home(homeModel):
      homeModel.onLogoutTapped = { [weak self] in
        guard let self else { return }
        self.user.password = ""
        self.focus = .password 
        self.destination = nil
      }
    case let .createNewAccount(createUserModel):
      createUserModel.onCreateMyAccountTapped = { [weak self] in
        guard let self else { return }
        self.user = createUserModel.newUser
        self.destination = nil
      }
    case .resetPassword, .dontHaveRewards, .none:
      break
    case .some(.alert(_)):
      break
    }
  }
  
  func dontHaveRewardsButtonTapped() {
    self.destination = .alert(
      AlertState(
        title: TextState("Having trouble finding your Rewards Number?"),
        message: TextState("Your rewards number will appear after first transaction. Please make sure you have created an account first."),
        buttons: [
          .default(TextState("Take me to Create Account"), action: .send(.takeToCreateAccount)),
          .destructive(TextState("Call Support"), action: .send(.callSupport)),
          .cancel(TextState("Ok, got it!"))
        ]
      )
    )
  }
  
  func alertButtonTapped(_ action: AlertAction) {
    switch action {
    case .takeToCreateAccount:
      debugPrint("takeToCreateAccount")
    case .callSupport:
      debugPrint("callSupport")
    case .dismiss:
      debugPrint("dismiss")
    }
  }
  
}

