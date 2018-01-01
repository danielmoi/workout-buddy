//
//  ExerciseViewController.swift
//  WorkoutBuddy
//
//  Created by Daniel Moi on 1/1/18.
//  Copyright © 2018 Daniel Moi. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var exercise: Exercise? = nil
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (exercise == nil) {
            print("NIL")
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            exercise = Exercise(context: context)
        }
        print("exercise:\(exercise)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        // create a Task from the outlet information
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//        let task = Task(context: context)
        
        exercise!.name = nameTextField.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Pop back
        navigationController!.popViewController(animated: true)
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
