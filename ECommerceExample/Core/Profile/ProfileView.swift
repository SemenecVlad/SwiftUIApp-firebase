//
//  ProfileView.swift
//  ECommerceExample
//
//  Created by Vladislav on 29.01.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            if let user = viewModel.currentUser {
                List {
                    Section {
                        HStack {
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(.circle)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                Text(user.email)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Section("General") {
                        HStack {
                            SettingRowView(imageName: "gear",
                                           title: "Version",
                                           tintColor: Color(.systemGray))
                            Spacer()
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(Color(.white))
                        }
                    }
                    Section("Account") {
                        Button {
                            viewModel.signOut()
                        } label: {
                            SettingRowView(imageName: "arrow.left.circle.fill",
                                           title: "Sign Out",
                                           tintColor: Color(.red))
                        }

                        Button {
                            print("Deleted Account...")
                        } label: {
                            SettingRowView(imageName: "xmark.circle.fill",
                                           title: "Delete Account",
                                           tintColor: Color(.red))
                        }
                    }
                }
            }
        }
        
    }
}





//#Preview {
//    ProfileView()
//}
