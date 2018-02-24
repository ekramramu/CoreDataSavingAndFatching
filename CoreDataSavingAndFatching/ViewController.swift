//
//  ViewController.swift
//  CoreDataSavingAndFatching
//
//  Created by Ekramul Hoque on 25/2/18.
//  Copyright © 2018 Ekramul Hoque. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tasks:[Task] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.backgroundColor = UIColor(white: 12, alpha: 1)
        navigationItem.title = "iLIST"
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getData()
        tableView.reloadData()
    }
    func getData() {
        
        do {
            
            tasks = try context.fetch(Task.fetchRequest())
        } catch {
            
            print("Error in Fatching Data")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        
        if let myName = task.name {
            
            cell.textLabel?.text = myName
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        if editingStyle == .delete {
       
            let task = tasks[indexPath.row]
            context.delete(task)
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            do {
                
                tasks = try context.fetch(Task.fetchRequest())
            } catch {
                print("Fatcing error")
            }
       
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }

}

