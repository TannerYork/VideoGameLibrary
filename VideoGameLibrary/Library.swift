//
//  Library.swift
//  VideoGameLibrary
//
//  Created by Tanner York on 9/13/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
let library = Library()
class Library {
    var games: [Game] = [skyrm, bridgeGame, haftLifeTree, fortnite]
    func addGame() {
        //Prompt user to enter a name for the game
        print("Whats your games name?")
        var newGameTitle = getInput()
        //Initial new game with the title entered
        var newGame = Game(title: newGameTitle, genre: "None", compatibility: "None", esbRating: "None")
        func printCurrentGame() {
            print("\n ")
            print("""
                Added Game
                Title: \(newGame.title)
                Genre: \(newGame.genre)
                Compatibility: \(newGame.compatibility)
                EBSRating: \(newGame.esbRating)
                NOTE: To change value enter "title", "genre", "compatibility", or "esbRating".
                To finish enter "finishGame"
                """)
        }
        var finishGame = true
        createGame: while finishGame {
            printCurrentGame()
            var userInput = getInput()
            if userInput == "title" {
                print("Enter new title")
                var gameName = getInput()
                newGame.title = gameName
                continue createGame
            }
            if userInput == "genre" {
                print("Enter games genre")
                let genre = getInput()
                newGame.genre = genre
                continue createGame
            }
            if userInput == "compatibility" {
                print("Enter compatibilty")
                let compatiblity = getInput()
                newGame.compatibility = compatiblity
                continue createGame
            }
            if userInput == "esbRating" {
                print("Enter ESB Rating.")
                var esbRating = getInput()
                newGame.esbRating = esbRating
                continue createGame
            }
            if userInput == "finishGame" {
                print("Are you sure your done? Y/N")
                var yesOrNo = getInput()
                yesOrNo: switch yesOrNo {
                case "Y":
                    games.append(newGame)
                    finishGame = false
                case"N":
                    continue createGame
                default:
                    print("Invaled Input")
                    userInput = getInput()
                }
            }
        }
        
        
        
        
        
    }
    func removeGame() {
        var titleOfGames: [String] = []
        for game in games {
            titleOfGames.append(game.title)
        }
        print("Which game would you like to remove?")
        for game in games {
            print(game.title)
        }
        var gameToBeRemoved = getInput()
        while titleOfGames.contains(gameToBeRemoved) == false {
            print("Game not in library")
            gameToBeRemoved = getInput()
        }
        for index in 0..<titleOfGames.count  {
            if titleOfGames[index].uppercased() == gameToBeRemoved.uppercased() {
                games.remove(at: index)
                
            }
        }
    }
    func checkGameOut() {
        //Goes through the games array, list out each game and its index, and take user input for which game the user wants to check out.
        for index in 0..<games.count {
            if games[index].checkedIn == true {
                print("\(index). \(games[index].title)")
            }
        }
        
        print("Please enter the index of the game you wish to check out: ")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        
        games[userInput!].checkedIn = false
        //Set the due date for the game.
        let currentCalendar = Calendar.current //This creates the current calendar for the user
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date()) //This generates a new Date object 2 weeks in the future by adding 14 days to the current date
        games[userInput!].dueDate = dueDate //Sets the due date of the game being checked out to the new date 2 weeks in the future
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("This game is due on: \(dateFormatter.string(from: dueDate!))")
        
    }
    
    func checkGameIn() {
        //print games checked out with index
        //get input for which game the user wants to check in
        //set checked in to true
        //set due date back to nil
        
        
        //Promt user to enter a checked out game and list current checked out games.
        print("Please enter the index of the game you wish to check in")
        for index in 0..<games.count {
            if games[index].checkedIn == false {
                print("\(index). \(games[index].title)")
            }
        }
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invaled Input")
            userInput = Int(readLine()!)
        }
        games[userInput!].checkedIn = true
        games[userInput!].dueDate = nil
    }
    
    func listUnavailbeGames() {
        for game in games {
            if game.checkedIn == false {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("\(game.title) is due on \(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
}

