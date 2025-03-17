//
//  ButtonComp.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 2/19/25.
//

import SwiftUI

struct ButtonComp: View {
    //completion handler like like call back function in react
    var buttonTitle: String = "Login"
    var handler: (() -> Void)
    var body: some View {
       

        Button {
         
            handler()
          
                } label: {
                    Text(buttonTitle)
                        .font(.system(size: 18, weight:.bold, design: .serif))
                        .foregroundColor(.white)
                        .padding(16)
                        
                }
        //rgb
//                .background(Color(red: 52/255, green: 152/255, blue:219/255) )
//                .background(Color(hex:"#eb984e ") )
        //width of the button - 32 padding left 16 and right 16
                .frame(width: UIScreen.main.bounds.size.width - 32, height: 50)
                .background(Color(hex: AppThemeColor.orange) )
                      .cornerRadius(8.0)
                
      
    }
}

#Preview {
   
    ButtonComp( handler : {
    })
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
       
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (no alpha)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
       
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}



//        Button("Log In") {
//            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//        }
//        .buttonStyle(.borderedProminent)
//        .tint(.blue)
//                        .font(.headline)
//                        .padding(.vertical, 20)
//                        .padding(.horizontal, 120)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
                     
                      
//        .padding([.leading,.trailing],20)
//        .padding([.top,.bottom],5)
        
        
       //dog image button
        
//        Button {
//            print("button tap")
//        } label: {
//            Image(systemName: "dog")
//                .resizable()
//                .frame(width: 80, height: 80)
//                .tint(.red)
//                .aspectRatio(contentMode: .fill)
//        }
