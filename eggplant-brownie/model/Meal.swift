//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Thiago Santos on 08/06/15.
//  Copyright (c) 2015 Thiago Santos. All rights reserved.
//

import Foundation

class Meal{
    let name:String
    let happiness:Int
    var items = Array<Item>()
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() ->Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}