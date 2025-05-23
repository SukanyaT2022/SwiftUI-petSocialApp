//
//  HomeView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/13/25.
//

import SwiftUI
enum PetCatergory: String {
    case dog
    case cat
    case bird
    case fish
  case others
}
struct HomeView: View {
    //store what user enter in search box
    //pur enum below - default is dog
    @State var catergory: PetCatergory = .dog
    
    @State var searchText: String = ""
    
 var filteredItems: [PetBreedModal] {
     print(searchText)
     //if nothting on search box then showll pets
     switch catergory {
         case .dog:
         if searchText.isEmpty {
                    return pets
                } else {
                    return pets.filter {
                        $0.type.lowercased()==("dog".lowercased())
                        || $0.breed.lowercased().contains(searchText.lowercased())
                    }
                }
         case .cat:
         if searchText.isEmpty {
                    return pets
                } else {
                    return pets.filter {
                        $0.type.lowercased()==("cat".lowercased())
                        || $0.breed.lowercased().contains(searchText.lowercased())
                    }
                }
         
    
     case .bird:
        break
     case .fish:
        break
     case .others:
       break
     }
   return []
        }
    @State private var pets: [PetBreedModal] = []
    
    //    var rows: [GridItem] = [
    //        GridItem(.flexible(minimum: 100))
    //    ]
    
    
    var rows: [GridItem] = [
        GridItem(.flexible(minimum: 50))
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
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
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
                
                                .padding(.top, -30)
                
                CatergoryViewAllBarView(leftTitle: "Catergory", buttonTitle: "View All") {
                    
                }
                
                OvalPetTypeMapCompView(selectedPet: catergory.rawValue)
                    .padding(.bottom, 10)
                    .frame(height: 180)
                    .padding(.vertical, 5)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, spacing: 15) {
//                        ForEach(pets) { pet in
                        ForEach(filteredItems) { pet in
                            PetCardView(
                                petName: pet.petName,
                                distance: pet.address.city,
                                imageName: pet.image
                            )
                            .padding(.vertical, 10)
                            .frame(width: 200)
                        }
                        .padding(.top, -50)
                        .padding(.leading, 25)
                    }
                    .onAppear {
                        pets = self.loadPetBreedsFromJSON()
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 5)
                
                
                Spacer()
            }//close main v stack
            
       
            .padding(.trailing, 10)
            
            .navigationBarItems(leading: VStack(alignment: .leading, spacing: 10) {
                Text("Let's Find")
                    .padding(.top, 50)
                Text("Little Friends!")
                
                    .font(.title)
            }
                .padding(.leading, 0)
            )
            .padding(.top, 80)
            .fontWeight(.semibold)
        }//close navigation stag/control the whole screen
        
        .padding(.leading, 10)
    }
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
