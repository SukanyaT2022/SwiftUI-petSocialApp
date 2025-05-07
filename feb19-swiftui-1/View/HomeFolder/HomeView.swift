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
        GridItem(.flexible(minimum: 50))
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    SearchBoxCompView(borderColorVar: Color(hex: AppThemeColor.orange))
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.orange)
                    }
                }
                .padding(.top, 50)
                
                CatergoryViewAllBarView(leftTitle: "Catergory", buttonTitle: "View All") {
                    
                }
                
                OvalPetTypeMapCompView()
                    .frame(height: 250)
                    // .padding(.vertical, 5)
                
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
                        .padding(.top, -30)
                        .padding(.leading, 25)
                    }
                    .onAppear {
                        pets = loadPetBreedsFromJSON()
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 5)
                
                .navigationBarItems(leading: VStack(alignment: .leading, spacing: 10) {
                    Text("Let's Find")
                    Text("Little Friends!")
                        .font(.title)
                }
                .padding(.leading, 5)
                .padding(.top, 80)
                .fontWeight(.semibold))
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
    }
}
#Preview {
    HomeView()
}
