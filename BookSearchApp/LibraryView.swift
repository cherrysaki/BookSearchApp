//
//  LibraryView.swift
//  BookSearchApp
//
//  Created by 神林沙希 on 2025/05/16.
//

import SwiftUI

struct LibraryView: View {
    @StateObject private var bookManager = BookManager()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            booksListView
                .navigationTitle("Library")
                .onAppear {
                    bookManager.fetchAllBooks()
                }
        }
    }
    
    var booksListView: some View {
        ScrollView {
            if !bookManager.favouritebooks.isEmpty {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(bookManager.favouritebooks, id: \.id) { book in
                        BookThumbnailView(book: book)
                            .padding()
                    }
                }
                .padding()
            } else {
                Text("結果が見つかりませんでした")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
    }
}

#Preview {
    LibraryView()
}
