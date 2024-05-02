//
//  ContentView.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    
    var character: Character
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            Text(character.name)
                .padding(.vertical, 20)
            
            HGRemoteImage(urlString: character.imageUrl ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            Spacer()
            
            Button {
                print("tapped")
            } label: {
                HGButton(title: "Add to favourites")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    CharacterDetailView(character: Character(name: "Test", imageUrl: "https://static.wikia.nocookie.net/disney/images/d/d3/Vlcsnap-2015-05-06-23h04m15s601.png"), isShowingDetail: .constant(true))
}
