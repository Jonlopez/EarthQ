//
//  ViewController.swift
//  EarthQ
//
//  Created by  on 17/1/17.
//  Copyright © 2017 8fprogmm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fecha_start : String?
    var fecha_end : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var change_fecha: UISegmentedControl!
    @IBAction func fecha_Value(_ sender: Any) {
        
        let date = Date()
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        
        let year =  components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        fecha_start = "\(year!)-\(month! - 1)-\(day!)T\(hour!-1):\(minute!-1):\(second!-1)"
        
        print(fecha_start!)
        
        switch change_fecha.selectedSegmentIndex {
        case 0:
            fecha_start = "\(year!)-\(month!)-\(day!)T\(hour!-1):\(minute!):\(second!)"
        case 1:
            fecha_start = "\(year!)-\(month!)-\(day!-1)T\(hour!):\(minute!):\(second!)"
        case 2:
            fecha_start = "\(year!)-\(month!)-\(day! - 7)T\(hour!):\(minute!):\(second!)"
        case 3:
            fecha_start = "\(year!)-\(month! - 1)-\(day!)T\(hour!):\(minute!):\(second!)"
        default:
            fecha_start = "\(year!)-\(month! - 1)-\(day!)T\(hour!):\(minute!):\(second!)"
        }
        
        fecha_end = "\(year!)-\(month!)-\(day!)T\(hour!):\(minute!):\(second!)"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var sliderMagnitud: UISlider!
    
    @IBAction func action_mag(_ sender: UISlider) {
        label_mag.text = "\(round(sliderMagnitud.value))"
    }
    
    @IBOutlet weak var label_mag: UILabel!
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "segueBuscar"){
            let destino = segue.destination as! PrincipalTableViewController
            
            destino.magnitud = sliderMagnitud.value
            destino.fecha_start = fecha_start!
            destino.fecha_end = fecha_end!
        }
    }
}

