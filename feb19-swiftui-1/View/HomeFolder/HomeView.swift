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
    
    @State private var pets: [PetBreedModal] = []
    
    //    var rows: [GridItem] = [
    //        GridItem(.flexible(minimum: 100))
    //    ]
    
    
    func loadPetBreedsFromJSON() -> [PetBreedModal] {
        guard let url = Bundle.main.url(forResource: "PetData", withExtension: "json") else {
            print("❌ pets.json not found in bundle")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let petsContainer = try decoder.decode(PetsContainer.self, from: data)
            return petsContainer.pets
        } catch {
            print("❌ Failed to load or decode pets.json: \(error)")
            return []
        }
    }
    
    var rows: [GridItem] = [
        GridItem(.flexible(minimum: 50),spacing: 0)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    SearchBoxCompView(borderColorVar: Color(hex: AppThemeColor.orange))
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.orange)
                    }
                }//close hstack
                
                                .padding(.top, -30)
                
                CatergoryViewAllBarView(leftTitle: "Catergory", buttonTitle: "View All") {
                    
                }
                
                OvalPetTypeMapCompView()
                    .padding(.bottom, 10)
                    .frame(height: 180)
                    .padding(.vertical, 5)
                    .background(Color.green)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, spacing: 15) {
                        ForEach(pets) { pet in
                            PetCardView(
                                petName: pet.petName,
                                distance: pet.address.city,
                                imageName: pet.image
                            )
                            .padding(.vertical, 10)
                            .frame(width: 200)
                        }
                        //                        .padding(.top, -50)
                        .padding(.leading, 25)
                    }//close lazy grid
                    .frame(height: 220)
                    .background(Color.pink)
                    .onAppear {
                        pets = loadPetBreedsFromJSON()
                    }
            
                }//close scrollview
                .frame(height: 220)
                .background(Color.blue)
                .padding(.horizontal, 5)
                
                
                Spacer()
            }//close main v stack
            
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            .navigationBarItems(leading: VStack(alignment: .leading, spacing: 10) {
                Text("Let's Find")
                    .padding(.top, 50)
                Text("Little Friends!")
                    .font(.title)
            }
            )
            .padding(.leading, 5)
            .padding(.top, 80)
            .fontWeight(.semibold)
            
        }
    }
}
#Preview {
    HomeView()
}
