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
            AsyncImage(url: character.processedImageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .detailImageModifier()
                case .failure(_):
                    Image(systemName: "camera.metering.unknown")
                        .detailImageModifier()
                case .empty:
                    ProgressView() // Displays a spinner while the image is loading
                        .frame(width: 300, height: 225)
                @unknown default:
                    Image(systemName: "photo")
                        .detailImageModifier()
                }
            }
            
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

extension Image {
    func detailImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 225)
    }
}

#Preview {
    CharacterDetailView(character: Character.testCharacter()	, isShowingDetail: .constant(true))
}
