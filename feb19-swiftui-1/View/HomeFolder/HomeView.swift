//
//  HomeView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/13/25.
//

import SwiftUI

struct HomeView: View {
    //store what user enter in search box
    @State var searchText:String = ""
    
    
    var body: some View {
        
        NavigationStack{
            
            VStack(alignment:.leading){
                
                    
                HStack{
                    SearchBoxCompView()
                    
                    Button {
                        
                    } label: {
                        Image(systemName:  "line.3.horizontal.decrease.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                        
                    }
                }
                .padding(.top,40)
//                end search bar and round filter
                
                CatergoryViewAllBarView(leftTitle: "Catergory", buttonTitle: "View All") {
                    
                }
             
                Spacer()
                
            }
//          above close main vstack
            .padding(.horizontal, 20)
            .padding(.top,15)
            //searcable is searchbox not component
//            .searchable(text: $searchText)
            
            //above end navigation stack
//            .navigationBarItems(leading: <#T##View#>, trailing: <#T##View#>)
// for navigation leading btn
            .navigationBarItems(leading:  VStack(alignment:.leading){
                Text("Let's Find")
                Text("Little Friends!")
                    .font(.title)
            }
                .padding(.leading, 20)
                .padding(.top, 80)
                .fontWeight(.semibold)
            )
            
            
            
        }
    }
    
}
#Preview {
    HomeView()
}
