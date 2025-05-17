//
//  BookManager.swift
//  BookSearchApp
//
//  Created by 神林沙希 on 2025/05/17.
//

import Foundation

class BookManager: ObservableObject{
    @Published var favouritebooks: [BookSummary] = []
    let dataManager = SwiftDataManager<BookSummary>()
    
    func saveBook(title: String, thumbnail: String?){
        let newBook = BookSummary(id: UUID().uuidString, title: title,thumbnail: thumbnail)
        dataManager.saveItem(data: newBook)
    }
    
    func fetchAllBooks(){
        let books = dataManager.fetchAll()
        self.favouritebooks = books
    }
}
