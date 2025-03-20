//
//  HomeView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/13/25.
//

import SwiftUI

struct HomeView: View {
    //create object - for viewmodel to do what we want with the data
    @StateObject private var viewModel =  DogViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("HomeScreen")
                List(viewModel.petData?.data ?? []) { item in
                    Text(item.attributes?.name ?? "")
                        .font(.title)
                        .foregroundStyle(Color.red)
                        .fontWeight(.bold)
                    Text(item.attributes?.description ?? "")
                        .font(.footnote)
                        .foregroundColor(Color.blue)
                        .fontWeight(.light)
                        .lineLimit(3)
                        
                }
                
                ButtonComp(buttonTitle: "go back to register", handler:  {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let window = windowScene.windows.first{
                        window.rootViewController = UIHostingController(rootView: RegisterScreenView(
                          )
                        )
                        window.makeKeyAndVisible()
                      
                    }
                
                }
                )
//                closing end of button component
                
                }
            }
          //above end navigation stack
        
        //below we call the api inside task
        .task {
            await viewModel.loadDogList()
        }
        }
      
    }


#Preview {
    HomeView()
}
