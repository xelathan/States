//
//  StatesListTableViewController.swift
//  StateListsApp
//
//  Created by Alex Tran on 10/26/20.
//

import UIKit
import CoreData

class StatesListTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, UISearchResultsUpdating {
    
    
    var fetchController: NSFetchedResultsController<StateItemMO>!
    
    var StateListItemsMO: [StateItemMO] = []
    
    var searchController: UISearchController!
    
    var searchResults: [StateItemMO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchResultsUpdater = self
        //self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.obscuresBackgroundDuringPresentation = false
        
        let fetchRequest: NSFetchRequest<StateItemMO> = StateItemMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchController.delegate = self
            
            do {
                try fetchController.performFetch()
                if let fetchedObjects = fetchController.fetchedObjects {
                    StateListItemsMO = fetchedObjects
                }
            } catch {
                print(error)
            }
            
            if StateListItemsMO.count == 0 {
                let seedItems: [StateListItem] = [
                    StateListItem("Alabama", "AL", "Flag_of_Alabama", "Seal_of_Alabama", "4,903,000", "Montgomery", "Birmingham", "52,419mi²"),
                    StateListItem("Alaska", "AK", "Flag_of_Alaska", "State_Seal_of_Alaska", "731,545", "Juneau", "Anchorage", "663,300mi²"),
                    StateListItem("Arizona", "AZ", "Flag_of_Arizona", "Arizona-StateSeal", "7,278,717", "Phoenix", "Phoenix", "113,990mi²"),
                    StateListItem("Arkansas", "AR", "Flag_of_Arkansas", "Seal_of_Arkansas", "3,017,804", "Little Rock", "Little Rock", "53,179mi²"),
                    StateListItem("California", "CA", "Flag_of_California", "Seal_of_California", "39,512,223", "Sacramento", "Los Angeles", "163,695mi²"),
                    StateListItem("Colorado", "CO", "Flag_of_Colorado", "Seal_of_Colorado", "5,758,736", "Denver", "Denver", "104,094mi²"),
                    StateListItem("Connecticut", "CT", "Flag_of_Connecticut", "Seal_of_Connecticut", "3,565,278", "Hartford", "Bridgeport", "5,543mi²"),
                    StateListItem("Delaware", "DE", "Flag_of_Delaware", "Seal_of_Delaware", "973,764", "Dover", "Wilmington", "2,489mi²"),
                    StateListItem("Florida", "FL", "Flag_of_Florida", "Seal_of_Florida", "21,477,737", "Tallahassee", "Jacksonville", "65,758mi²"),
                    StateListItem("Georgia", "GA", "Flag_of_Georgia", "Seal_of_Georgia", "10,617,423", "Atlanta", "Atlanta", "59,425mi²"),
                    StateListItem("Hawaii", "HI", "Flag_of_Hawaii", "Seal_of_Hawaii", "1,415,872", "Honolulu", "Honolulu", "10,932mi²"),
                    StateListItem("Idaho", "ID", "Flag_of_Idaho", "Seal_of_Idaho", "1,787,065", "Boise", "Boise", "83,569mi²"),
                    StateListItem("Illinois", "IL", "Flag_of_Illinois", "Seal_of_Illinois", "12,671,821", "Springfield", "Chicago", "57,914mi²"),
                    StateListItem("Indiana", "IN", "Flag_of_Indiana", "Seal_of_Indiana", "6,732,219", "Indianapolis", "Indianapolis", "36,420mi²"),
                    StateListItem("Iowa", "IA", "Flag_of_Iowa", "Seal_of_Iowa", "3,155,070", "Des Moines", "Des Moines", "56,273mi²"),
                    StateListItem("Kansas", "KS", "Flag_of_Kansas", "Seal_of_Kansas", "2,913,314", "Topeka", "Wichita", "82,278mi²"),
                    StateListItem("Kentucky", "KY", "Flag_of_Kentucky", "Seal_of_Kentucky", "4,467,673", "Frankfort", "Louisville", "40,408mi²"),
                    StateListItem("Louisiana", "LA", "Flag_of_Louisiana", "Seal_of_Louisiana", "4,648,794", "Baton Rouge", "New Orleans", "52,378mi²"),
                    StateListItem("Maine", "ME", "Flag_of_Maine", "Seal_of_Maine", "1,344,212", "Augusta", "Portland", "35,380mi²"),
                    StateListItem("Maryland", "MD", "Flag_of_Maryland", "Seal_of_Maryland", "6,045,680", "Annapolis", "Baltimore", "12,406mi²"),
                    StateListItem("Massachusetts", "MA", "Flag_of_Massachusetts", "Seal_of_Massachusetts", "6,892,503", "Boston", "Boston", "10,554mi²"),
                    StateListItem("Michigan", "MI", "Flag_of_Michigan", "Seal_of_Michigan", "9,986,857", "Lansing", "Detroit", "96,714mi²"),
                    StateListItem("Minnesota", "MN", "Flag_of_Minnesota", "Seal_of_Minnesota", "5,639,632", "St. Paul", "Minneapolis", "86,936mi²"),
                    StateListItem("Missouri", "MO", "Flag_of_Missouri", "Seal_of_Missouri", "6,137,428", "Jefferson City", "Kansas City", "69,707mi²"),
                    StateListItem("Montana", "MT", "Flag_of_Montana", "Seal_of_Montana", "1,068,778", "Helena", "Billings", "147,040mi²")]
                
                for item in seedItems {
                    let seededItem = StateItemMO(context: context)
                    seededItem.name = item.name
                    seededItem.abbreviation = item.abbreviation
                    seededItem.flag = item.flag
                    seededItem.seal = item.seal
                    seededItem.population = item.population
                    seededItem.capital = item.capital
                    seededItem.largest = item.largest
                    seededItem.area = item.area
                    
                    appDelegate.saveContext()
                }
            }
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let insertIndexPath = newIndexPath {
                tableView.insertRows(at: [insertIndexPath], with: .fade)
            }
            
        case .delete:
            if let deleteIndexPath = indexPath {
                tableView.deleteRows(at: [deleteIndexPath], with: .fade)
            }
            
        case .update:
            if let updateIndexPath = indexPath {
                tableView.reloadRows(at: [updateIndexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
        
        if let fetchedObjects = controller.fetchedObjects {
            StateListItemsMO = fetchedObjects as! [StateItemMO]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive {
            return searchResults.count
        } else {
            return StateListItemsMO.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath) as! StateListTableViewCell
        
        var myStateItem: StateItemMO
        if searchController.isActive {
            myStateItem = searchResults[indexPath.row]
        } else {
            myStateItem = StateListItemsMO[indexPath.row]
        }
        

        // Configure the cell...
        cell.stateName.text = myStateItem.name
        cell.stateFlag.image = UIImage(named: myStateItem.flag ?? "")
        
        //Adding animation
        //Fade in state name
        cell.stateName.alpha = 0.5;
        UIView.animate(withDuration: 2, animations: {cell.stateName.alpha=1})
        
        //rounding image borders
        cell.stateFlag.layer.cornerRadius = cell.stateFlag.frame.size.width / 4
        cell.stateFlag.clipsToBounds = true
        cell.stateFlag.layer.masksToBounds = true
        
        //Fly in animation
        var rotationTransform : CATransform3D = CATransform3DIdentity
        rotationTransform = CATransform3DTranslate(rotationTransform, -250, -250, 0)
        cell.stateFlag?.layer.transform = rotationTransform
        UIView.animate(withDuration: 2, animations: {cell.stateFlag?.layer.transform =  CATransform3DIdentity})
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    /*// Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                let context = appDelegate.persistentContainer.viewContext
                let deleteItem = self.fetchController.object(at: indexPath)
                context.delete(deleteItem)
                appDelegate.saveContext()
            }
            // Delete the row from the data source
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }*/
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stateSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let mysegue = segue.destination as! StateDescriptionViewController
                
                var myStateItem: StateItemMO
                if searchController.isActive {
                    myStateItem = searchResults[indexPath.row]
                } else {
                    myStateItem = StateListItemsMO[indexPath.row]
                }
                mysegue.name = myStateItem.name
                mysegue.flag = UIImage(named: myStateItem.flag ?? "")
                mysegue.seal = UIImage(named: myStateItem.seal ?? "")
                mysegue.abbr = myStateItem.abbreviation
                mysegue.population = myStateItem.population
                mysegue.capital = myStateItem.capital
                mysegue.biggestcity = myStateItem.largest
                mysegue.area = myStateItem.area
            }
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        if let textToSearch = searchController.searchBar.text {
            filterContentForSearchText(searchText: textToSearch)
            tableView.reloadData()
        }
    }
    
    func filterContentForSearchText(searchText: String) {
        searchResults = StateListItemsMO.filter( { (searchItem: StateItemMO) -> Bool in
            let nameMatch = searchItem.name?.range(of: searchText, options: String.CompareOptions.caseInsensitive)
            return nameMatch != nil
        })
    }
}

