//
//  PlaylistVM.swift
//  MusicAppBDD
//
//  Created by Temitope Gabriel Molomo  on 22/09/2023.
//

import Foundation

final class PlaylistVM:ObservableObject {
    @Published var playlist:[Song] = []
    
    func addToPlaylist(song:Song) {
        if (playlistContainSong(song: song)) {
            return
        }
        
        playlist.append(song)
    }
    
    func removeFromPlaylist(index:Int) {
        playlist.remove(at: index)
    }
    
    func playlistContainSong(song:Song) -> Bool {
        for existingSong in playlist {
            if (existingSong.id == song.id) {
                return true
            }
        }
        
        return false
    }
}
