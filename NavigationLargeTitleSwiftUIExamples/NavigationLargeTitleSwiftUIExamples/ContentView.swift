//
//  ContentView.swift
//  NavigationLargeTitleSwiftUIExamples
//
//  Created by Kiarash Vosough on 4/22/23.
//

import SwiftUI
import NavigationLargeTitleSwiftUI

struct ContentView: View {

    struct Item: Identifiable {
        let id: UUID = UUID()
        let number: String
    }
    
    let items = (0...20).map { Item(number: String($0)) }
    
    var body: some View {
        NavigationView {
            NavigationLink("Tap to navigate") {
                VStack {
                    ForEach(items) { item in
                        Text(item.number)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color.gray)
                    }
                }
                .padding(.all, 20)
                .largeNavigationTitleOnScroll(title: "Test")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
