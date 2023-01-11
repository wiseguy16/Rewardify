//
//  HomeView.swift
//  Standups
//
//  Created by GWE48A on 1/10/23.
//
import SwiftUI
import SwiftUINavigation

struct HomeView: View {
  @ObservedObject var homeModel: HomeModel
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        Divider()
        
        Text("Hello, ") +
        Text("\(homeModel.user.email)").bold()
        Text("Welcome to your account!")
        
        Divider()
        
        Text("Your rewards ") +
        Text("\(homeModel.user.rewardsNumber)").foregroundColor(.red).bold() +
        Text(" are up to date!.")
      }
    }
    .navDisplayed(with: .mint, colorScheme: .dark)
    .navigationTitle(
      Text("Home")
    )
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button("Logout") {
          self.homeModel.onLogoutTapped()
        }.foregroundColor(.white)
      }
    }
    .navigationBarBackButtonHidden(true)
    .padding()
  }
}


struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      HomeView(homeModel: HomeModel(user: .mock))
    }
  }
}
