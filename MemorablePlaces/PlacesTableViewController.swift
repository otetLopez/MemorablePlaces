//
//  PlacesTableViewController.swift
//  MemorablePlaces
//
//  Created by otet_tud on 1/13/20.
//  Copyright © 2020 otet_tud. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {
    var placesList = [Place]()
    var listIdx : Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "places", for: indexPath)
        cell.textLabel?.text = placesList[indexPath.row].getAddress()
        return cell
    }
    
    func addPlace(place: Place) {
        print("DEBUG: Added place \(place.getAddress()) \(place.getCoordinates)")
        placesList.append(place)
    }
    
    func addPlace(place: Place, index: Int) {
        print("DEBUG: Update place \(place.getAddress()) \(place.getCoordinates)")
        placesList.insert(place, at: index)
    }
    
    func removePlace(address: String) {
        print("DEBUG: Removing \(address)")
        if placesList.count > 0 {
            var index : Int = 0
            for p in placesList {
                if p.getAddress() == address {
                    placesList.remove(at: index)
                }
                index += 1
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        listIdx = -1
        print("DEBUG: Total places \(placesList.count)")
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listIdx = indexPath.row
        print("You selected \(listIdx) \(placesList[indexPath.row].getAddress())")
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let mapView = segue.destination as? MapViewController {
            mapView.delegate = self
        }
    }
    

}
