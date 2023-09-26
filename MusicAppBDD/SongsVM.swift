//
//  SongsVM.swift
//  MusicAppBDD
//
//  Created by Temitope Gabriel Molomo  on 22/09/2023.
//

import Foundation

final class SongsVM:ObservableObject {
    let songs = Bundle.main.decode([Song].self, from: "MusicDatabase.json")!
}
