//
//  PrincipalTableViewController.swift
//  EarthQ
//
//  Created by  on 7/2/17.
//  Copyright © 2017 8fprogmm. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PrincipalTableViewController: UITableViewController {
    
    var terremotosJSON : JSON! = nil
    
    var magnitud:Float = 0
    
    var fecha_start:String?

    var fecha_end:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get_data_url()
    }

    func get_data_url(){
        Alamofire.request("https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=\(self.fecha_start!)&endtime=\(self.fecha_end!)&minmagnitude=\(self.magnitud)").responseJSON { response in
            print(response.request ?? "error")  // original URL request
            print(response.response ?? "error") // HTTP URL response
            print(response.data ?? "error")     // server data
            print(response.result)   // result of response serialization
            
            switch response.result {
                
            case .success(let value):
                
                let json = JSON(value)
                
                self.terremotosJSON = json
                
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if self.terremotosJSON != nil {
            return (self.terremotosJSON?["features"].underestimatedCount)!
        }else{
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MiCelda", for: indexPath) as! PrincipalTableViewCell
        
        cell.etiqueta.text = (self.terremotosJSON?["features"][indexPath.row]["properties"]["place"].stringValue)
        
        print( "Nombre del terremoto -> \(self.terremotosJSON?["features"][indexPath.row]["properties"]["place"])")
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }*/

}
