//
//  SearchRowView.swift
//  BookSearchApp
//
//  Created by 神林沙希 on 2025/05/17.
//

import SwiftUI


struct SearchRowView: View {
    @StateObject private var bookManager = BookManager()
    @State var isSaved: Bool = false
    let item: Item
    
    var body: some View {
        HStack {
            if let thumbnailUrl = item.volumeInfo.imageLinks?.thumbnail {
                AsyncImage(url: URL(string: thumbnailUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(item.volumeInfo.title ?? "")
                    .font(.headline)
                    .bold()
                Text(item.volumeInfo.publisher ?? "")
                    .font(.caption)
            }
            
            
            
            Button(action: {
                guard !isSaved else { return }
                bookManager.saveBook(title: item.volumeInfo.title ?? "", thumbnail: item.volumeInfo.imageLinks?.thumbnail)
                isSaved = true
            }, label: {
                Image(systemName: isSaved ? "star.fill" : "star")
            })
            .buttonStyle(PlainButtonStyle())
        }
    }
}


#Preview {
    SearchRowView(item: Item(kind: "", id: "0", selfLink: "", volumeInfo: VolumeInfo()))
}
