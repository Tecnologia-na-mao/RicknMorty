//
//  ContentView.swift
//  RicknMorty
//
//  Created by Samuel Santos on 29/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var postListVM = PostListView()
    
    var body: some View {
        
        HStack{
            Text("Update")
                .font(.headline)
                .onTapGesture {
                    postListVM.populateCards()
                }
            
        }
        List(postListVM.posts, id: \.id){post in
            
            ZStack {
                AsyncImage(url: URL (string: post.image))
                
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Text(post.name)
                            .foregroundColor(Color.black)
                            .font(.headline)
                            
                    }.background(Color.purple)
                    .opacity(0.6)
                    .padding(6)
                    HStack{
                        Spacer()
                        VStack{
                            Text(post.species)
                                .foregroundColor(Color.white)
                                .font(.headline)
                            Text(post.status)
                                .foregroundColor(Color.white)
                                .font(.headline)
                            Text(post.gender)
                                .foregroundColor(Color.white)
                                .font(.headline)
                        }
                    }.background(Color.blue)
                        .opacity(0.8)
                        .padding(6)
                }
                
            }.cornerRadius(8)
            
        }.onAppear(perform:  {
            postListVM.populateCards()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
