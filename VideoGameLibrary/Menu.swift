//
//  Menu.swift
//  VideoGameLibrary
//
//  Created by Tanner York on 9/11/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
var menu = Menu()
class Menu {
    var shouldQuit = false
    
    func go() {
        //This function is going to handle making the menu run, It will display the menu and take user input untill the user wishes to quit the aplication
        Game: while !shouldQuit {
            printUserMenu()
           var input = getInput()
            let validatedInput = validateINput(input)
            if validatedInput {
                handleInput(input)
            }
        }
        
    }
    
    func printUserMenu() { //A menu for normal users of the library. Normal users can only checkout and play games.
        print("""
         Video Game Library
1. List Current Games In Library
2. List Curent Games Checked Out
3. Checkout Games
4. Return Games
5. Exit
6. Add Games
7. Remove Games
""")
    }
    
    func handleInput(_ input: String) {
        
        switch input {
        case "1":
            //list current games in library
            for games in library.games {
                if games.checkedIn {
                    print(games.title)
                }
            }
        case "2":
            //list checkout games
            library.listUnavailbeGames()
        case "3":
            //give user opions for checking out games
            library.checkGameOut()
        case "4":
            //give user options to return games
            library.checkGameIn()
        case "5":
            //exit program
            menu.quit()

        case "6":
            //add game
            library.addGame()
        case "7":
            //remove game
            library.removeGame()
        default:
            break
        }
    
        
    }
    func quit() {
        //This functionwill be called when user or admin wishes to quit.
        shouldQuit = true
        print("Thanks for user the application.")
    }
    func getInput() -> String {
        var userInput = readLine()
        while userInput == nil || userInput == "" {
            print("Invaled Input")
            userInput = readLine()
        }
     return userInput!
        
    }
    //This only works when the user inputs 1 because the for statment goes through every element and if the input doesn't equal all of the elements it returns false.
//    func validateInput(_ input: String) -> Bool {
//        let avaliableInput = ["1","2","3","4","5","6","7"]
//        for options in avaliableInput {
//            if input == options {
//                return true
//            } else {
//                return false
//            }
//
//        }
//    }
    func validateINput(_ input: String) -> Bool { //This method creates an array of ints. Then, it trys to convert the inout to an integer and if it false it return false and if it successeds it checks if the int is in the array of ints and returns true or false based off that.
        let validMenuOption = Array(1...8)
        guard let number = Int(input) else {
            return false
        }
        return validMenuOption.contains(number)
    }
    
}

//Get gets userInput and text for a valid string. If the string is valde it returns the input, and if the input is invaled it keeps going untill user inputs valid input
func getInput() -> String {
    var userInput = readLine()
    while userInput == nil || userInput == "" {
        print("Invaled Input")
        userInput = readLine()
    }
    return userInput!
    
}

