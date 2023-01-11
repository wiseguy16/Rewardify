//
//  LoginView.swift
//  Standups
//
//  Created by GWE48A on 1/5/23.
//
import SwiftUI
import SwiftUINavigation

struct LoginView: View {
  
  @FocusState var focus: Field?
  @ObservedObject var loginModel: LoginModel
  
  init(loginModel: LoginModel) {
    self.loginModel = loginModel
  }
  
  enum Field: Hashable {
    case email
    case password
    case rewards
  }
  
  var body: some View {
    NavigationStack {
      Form {
        Section {
          TextField("Enter email", text: $loginModel.user.email)
            .onSubmit {
              loginModel.userTappedReturn()
            }
            .focused($focus, equals: .email)
          TextField("Enter password", text: $loginModel.user.password)
            .onSubmit {
              loginModel.userTappedReturn()
            }
            .focused($focus, equals: .password)
        }
      header: {
        Text("Login to your account")
      }
        
        Section {
          TextField("Enter Rewards number", text: $loginModel.user.rewardsNumber)
            .onSubmit {
              loginModel.userTappedReturn()
            }
            .focused($focus, equals: .rewards)
        }
      header: {
        Text("Enter Rewards number")
      }
        
        Section {
          Button("Submit") {
            loginModel.submitButtonTapped()
          }
          .frame(maxWidth: .infinity)
        }
        Section {
          Button("Create New Account") {
            loginModel.createNewAccountTapped()
          }
          .frame(maxWidth: .infinity)
          Button("Don't have Rewards Number?") {
            loginModel.dontHaveRewardsButtonTapped()
          }
          .frame(maxWidth: .infinity)
        }
        
      }
      .bind($loginModel.focus, to: $focus)
      .navigationTitle("Rewardify")
      .navDisplayed(with: .mint, colorScheme: .dark)
      .navigationDestination(
        unwrapping: self.$loginModel.destination,
        case: /LoginModel.Destination.home
      ) { $model in
        HomeView(homeModel: model)
      }
      .sheet(
        unwrapping: self.$loginModel.destination,
        case: /LoginModel.Destination.createNewAccount
      ) { $model in
        NavigationStack {
          CreateAccountView(model: model)
            .navigationTitle("Create New Account")
            .toolbar {
              ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                  self.loginModel.newAccountCancelTapped()
                }
              }
            }
        }
      }
      .alert(
        unwrapping: self.$loginModel.destination,
        case: /LoginModel.Destination.alert
      ) { action in
        self.loginModel.alertButtonTapped(action)
      }
      
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(loginModel: LoginModel(user: .blank))
  }
}




