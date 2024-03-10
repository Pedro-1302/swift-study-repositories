//
//  ContentView.swift
//  SwiftUI-List-Starter
//
//  Created by Sean Allen on 4/23/21.
//

import SwiftUI

struct VideoListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        
        NavigationView() {
            List(videos, id: \.id) { video in
                NavigationLink(destination: VideoDetailView(video: video), label: {
                    VideoCell(video: video)
                })
                
            }
            .listStyle(.plain)
            .navigationTitle("Seans's Top 10")
        }
        
    }
}



struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
