//
//  ViewController.swift
//  EarthQ
//
//  Created by  on 17/1/17.
//  Copyright © 2017 8fprogmm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var sliderMagnitud: UISlider!
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "segueBuscar"){
            let destino = segue.destination as! PrincipalTableViewController
            
            destino.magnitud = sliderMagnitud.value
        }
    }
}

