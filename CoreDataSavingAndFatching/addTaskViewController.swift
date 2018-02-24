//
//  addTaskViewController.swift
//  CoreDataSavingAndFatching
//
//  Created by Ekramul Hoque on 25/2/18.
//  Copyright © 2018 Ekramul Hoque. All rights reserved.
//

import UIKit

class addTaskViewController: UIViewController {

    @IBOutlet weak var taskFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    
    @IBAction func addTaskBUttonWasPressed(_ sender: UIButton) {
   
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // another way to make new appdelegate and persestant container
        
        
        if (taskFiled.text?.isEmpty)! {
            let alartController = UIAlertController(title: "Text Filed Empty", message: "Your should textSometing", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action:UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
            })
            alartController.addAction(okAction)
            alartController.addAction(cancelAction)
           
            present(alartController, animated: true, completion: nil)
        }
        
        // make app delegate
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let contextTwo = appDelegate?.persistentContainer.viewContext else {return}
        
       let task = Task(context: context)
        task.name = taskFiled.text!
        
        //saving data to coredata
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //let _ = navigationController?.popViewController(animated: true)
        
       let _ = navigationController?.popViewController(animated: true)
        
       // self.dismiss(animated: true, completion: nil)
    
    }
    
    

   

}
