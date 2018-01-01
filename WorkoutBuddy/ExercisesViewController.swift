//
//  ExercisesViewController.swift
//  WorkoutBuddy
//
//  Created by Daniel Moi on 1/1/18.
//  Copyright © 2018 Daniel Moi. All rights reserved.
//

import UIKit

class ExercisesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var exercises: [Exercise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getExercises()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let exercise = exercises[indexPath.row]
        cell.textLabel?.text = exercise.name
        return cell
    }
    
    func getExercises() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            exercises = try context.fetch(Exercise.fetchRequest()) as! [Exercise]
        } catch {
            print("OOPS ERROR")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("***********")
        print("sender:\(sender)")
        if (segue.identifier == "viewExerciseSegue") {
            let nextVC = segue.destination as! ExerciseViewController
            nextVC.exercise = sender as? Exercise
        }
        
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        
        
        performSegue(withIdentifier: "viewExerciseSegue", sender: nil )
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
