//
//  DevelopersViewController.swift
//  StateListsApp
//
//  Created by Alex Tran on 10/29/20.
//

import UIKit
import CoreData

class DevelopersViewController: UIViewController, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var alexButton: UIButton!
    @IBOutlet weak var harishButton: UIButton!
    @IBOutlet weak var praveenButton: UIButton!
    
    var fetchController: NSFetchedResultsController<DeveloperMO>!
    
    var DevelopersMO: [DeveloperMO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        alexButton.layer.cornerRadius = 6
        alexButton.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        praveenButton.layer.cornerRadius = 6
        praveenButton.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        harishButton.layer.cornerRadius = 6
        harishButton.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        
        let fetchRequest: NSFetchRequest<DeveloperMO> = DeveloperMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            fetchController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchController.delegate = self
            
            do {
                try fetchController.performFetch()
                if let fetchedObjects = fetchController.fetchedObjects {
                    DevelopersMO = fetchedObjects
                }
            } catch {
                print(error)
            }
            
            if DevelopersMO.count == 0 {
                let seedObjects = [Developer(Name: " Alex Tran", Age: " 17 years old", Gender: " Male", From: " From San Jose, CA", Hobby: " Likes to watch anime"), Developer(Name: " Harish Rajmohan", Age: " N/A", Gender: " Male", From: " N/A", Hobby: " N/A"), Developer(Name: " Praveen Sharma", Age: " 50 years old", Gender: " Male", From: " Bay Area, CA", Hobby: " Likes Gadgets, Travel")]
                
                for object in seedObjects {
                    let seededObject = DeveloperMO(context: context)
                    seededObject.name = object.name
                    seededObject.age = object.age
                    seededObject.from = object.from
                    seededObject.gender = object.gender
                    seededObject.hobby = object.hobby
                    
                    appDelegate.saveContext()
                }
            }
            
        }
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "alexIdentifier" {
            let mySegue = segue.destination as! ViewController
            mySegue.name = DevelopersMO[0].name
            mySegue.age = DevelopersMO[0].age
            mySegue.gender = DevelopersMO[0].gender
            mySegue.from = DevelopersMO[0].from
            mySegue.hobby = DevelopersMO[0].hobby
        }
        if segue.identifier == "praveenIdentifier" {
            let mySegue = segue.destination as! ViewController
            mySegue.name = DevelopersMO[2].name
            mySegue.age = DevelopersMO[2].age
            mySegue.gender = DevelopersMO[2].gender
            mySegue.from = DevelopersMO[2].from
            mySegue.hobby = DevelopersMO[2].hobby
            
        }
        if segue.identifier == "harishIdentifier" {
            let mySegue = segue.destination as! ViewController
            mySegue.name = DevelopersMO[1].name
            mySegue.age = DevelopersMO[1].age
            mySegue.gender = DevelopersMO[1].gender
            mySegue.from = DevelopersMO[1].from
            mySegue.hobby = DevelopersMO[1].hobby
        }
    }
    

}
