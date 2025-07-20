//
//  HomeView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/13/25.
//

import SwiftUI
enum PetCatergory: String, CaseIterable {
    case dog
    case cat
    case bird
    case fish
  case none
}
struct HomeView: View {
    //store what user enter in search box
    //pur enum below - default is dog
    @State var catergory: PetCatergory = .none
    
    @State var searchText: String = ""
    
    var filteredItems: [PetBreedModal] {
        print(searchText)
        //-- searchbox-if nothting on search box then showll pets
        if catergory == .none {
            //below user type on search text or not
            if searchText.isEmpty {
                return pets
            }else {
                //             if user type something go to line 32 to 38- filter something
                return pets.filter {
                    
                    $0.type.lowercased() ==   searchText.lowercased()
                    ||
                    
                    $0.breed.lowercased().contains(searchText.lowercased())
                }
            }
        }else{
            //oval caterory - if user select click oval catergory
            return pets.filter {
                $0.type.lowercased() ==   catergory.rawValue.lowercased()
                ||
                $0.type.lowercased() ==   searchText.lowercased()
                ||
                
                $0.breed.lowercased().contains(searchText.lowercased())
                //         || $0.type.lowercased().contains(searchText.lowercased()))
                
            }
        }
        
        
    }
    @State private var pets: [PetBreedModal] = []
    
    
    var rows: [GridItem] = [
        GridItem(.adaptive(minimum: 300, maximum: 400))
    ]
    //this func for call api or json file- also look at line 86 on appear to connect json file
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
    
    var body: some View {
        
        //        NavigationStack {
        VStack(alignment: .leading, spacing: 20) {
            Text("Welcome to PetSocial!")
            
            HStack(spacing: 0) {
                //search bar
                
                SearchBoxCompView(
                    // storeUserInput:variable comfrom search box component
                    storeUserInput: $searchText,
                    borderColorVar: Color(hex: AppThemeColor.orange))
                
                
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.orange)
                }
            }//close hstack
            
            CatergoryViewAllBarView(leftTitle: "Catergory", buttonTitle: "View All") {
                
            }
            
            OvalPetTypeMapCompView(selectedPet: $catergory)
                .frame(height: 180)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 15) {
                    ForEach(filteredItems) { pet in
                        NavigationLink(destination:
                                        // this line beblow we pass data from home screen to detail ascreen
                                        PetDetail(petPassDataFromtHomeVar: pet)) {
                            PetCardView(
                                petName: pet.petName,
                                distance: pet.address.city,
                                imageName: pet.image,
                                petType: pet.type
                            )
                            .padding(.horizontal, 16)
                        }
                    }
                }
                .padding(.vertical, 10)
            }
            .onAppear {
                pets = self.loadPetBreedsFromJSON()
            }
        }
        .padding(.horizontal, 5)
        .padding(.top, 20)
        .fontWeight(.semibold)
        
    }//close navigation stag/control the whole screen
    
}
#Preview {
    HomeView()
}


//enum SearchUsing {
//
//    case name
//
//    case category
//
//    case type
//
//    case distance
//
//    case size
//
//}
//
//
//var searchingUsing: SearchUsing = .name
//
//searchingUsing = .category
//
//var isSearchForName: Bool = true
//
//var filteredData: [PetMode] {
//
//    switch searchingUsing {
//
//    case .name:
//
//        return filteredData.filter({$0.name == "text we are searcimg"} ||  $0.category == "text we are searcimg" || {$0.type == "text we are searcimg"} || {$0.distance == "text we are searcimg"} )
//
//    case .category:
//
//        return filteredData.filter({$0.category == "text we are searcimg"})
//
//    case .type:
//
//        return filteredData.filter({$0.type == "text we are searcimg"})
//
//    case .distance:
//
//        return filteredData.filter({$0.distance == "text we are searcimg"})
//
//=
//
//    case .size
//
//    }
//
//}
