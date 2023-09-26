//
//  Song.swift
//  MusicAppBDD
//
//  Created by Temitope Gabriel Molomo  on 22/09/2023.
//

import Foundation

struct Song:Codable, Identifiable, Hashable {
    let id: Int
    let cover: String
    let title: String
    let artiste: String
    let song: String
}
