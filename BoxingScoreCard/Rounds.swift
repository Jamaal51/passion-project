//
//  Rounds.swift
//  BoxingScoreCard
//
//  Created by Jamaal Sedayao on 2/18/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import Foundation

class Rounds {
    var name: String
    var redScore: Int = 0
    var blueScore: Int = 0
    var winnerOfRound: String
    
    init(name: String, redScore: Int, blueScore:Int, winnerOfRound:String){
    self.name = name
    self.redScore = redScore
    self.blueScore = blueScore
    self.winnerOfRound = winnerOfRound
    }
}

