//
//  Game.swift
//  VideoGameLibrary
//
//  Created by Tanner York on 9/10/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation

class Game {
    var dueDate: Date? = nil
    var title: String
    var genre: String
    var compatibility: String
    var esbRating: String
    var checkedIn: Bool = true
    
    
    init(title: String, genre: String, compatibility: String, esbRating:String) {
        self.title = title
        self.genre = genre
        self.compatibility = compatibility
        self.esbRating = esbRating
    }
    func checkedOut() {
        checkedIn = false
    }
}
let bridgeGame = Game(title: "BridgeGame", genre: "RPG", compatibility: "Xcode", esbRating: "E")
let fortnite = Game(title: "Fortnite", genre: "Battle Royal", compatibility: "ALl", esbRating: "E")
let skyrm = Game(title: "Skyrm", genre: "Open World", compatibility: "All", esbRating: "T")
let haftLifeTree = Game(title: "Half Life 3", genre: "Unknown", compatibility: "Unknown", esbRating: "G")
