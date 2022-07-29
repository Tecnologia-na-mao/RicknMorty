//
//  DataApiView.swift
//  RicknMorty
//
//  Created by Samuel Santos on 29/07/22.
//

import Foundation

class PostListView: ObservableObject {
    
    @Published var posts: [PostViewModel] = [PostViewModel]()
    
    func populateCards() {
        
        WebService().fetchData { (result) in
            switch result {
            case .success(let posts):
                
                DispatchQueue.main.async {
                    
                    print(posts)
                         self.posts = posts.map(PostViewModel.init)

                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct PostViewModel {
    
    let post: ApiData
    
    var id: Int {
        post.id
    }
    
    var name: String {
        post.name
    }
    
    var image: String {
        post.image
    }
    
    var species: String {
        post.species
    }
    var status: String{
        post.status
    }
    var type: String{
        post.type
    }
    var gender: String{
        post.gender
    }
}
