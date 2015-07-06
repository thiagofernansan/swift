//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Thiago Santos on 08/06/15.
//  Copyright (c) 2015 Thiago Santos. All rights reserved.
//

import UIKit

protocol addAMealDelegate {
    func add(meal:Meal)
}

class MealsTableViewController: UITableViewController, addAMealDelegate {
    
    var meals = [Meal(name: "eggplat brownie", happiness: 5),
                Meal(name: "zucchini muffin", happiness: 3)]
    
    func add(meal:Meal) {
        self.meals.append(meal)
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let meal = meals[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal" {
           var view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }

   
}
