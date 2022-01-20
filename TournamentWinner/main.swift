//
//  main.swift
//  TournamentWinner
//
//  Created by Dylan Sewell on 1/20/22.
//

import Foundation

let HOME_TEAM_WON = 1

class Program {
    
    // O(n) time | O(k) space where n is number of competitions, k is number of teams
    static func tournamentWinner(_ competitions: [[String]], _ results: [Int]) -> String {
        var currentBestTeam = ""
        var scores = [String: Int]()
        
        scores[currentBestTeam] = 0
        
        for (idx, competition) in competitions.enumerated() {
            let result = results[idx]
            let (homeTeam, awayTeam) = (competition[0], competition[1])
            
            var winningTeam = awayTeam
            if result  == HOME_TEAM_WON {
                winningTeam = homeTeam
            }
            
            updateScores(winningTeam, 3, &scores)
            
            if scores[winningTeam]! > scores[currentBestTeam]! {
                currentBestTeam = winningTeam
            }
        }
        return currentBestTeam
    }
    
    static func updateScores(_ team: String, _ points: Int, _ scores: inout [String: Int]) {
        if scores[team] == nil {
            scores[team] = 0
        }
        scores[team] = scores[team]! + points
    }
    
}

var competitions = [
    ["HTML", "C#"],
    ["C#", "Python"],
    ["Python", "HTML"]
  ]

var results = [0, 0, 1]

print(Program.tournamentWinner(competitions, results))
