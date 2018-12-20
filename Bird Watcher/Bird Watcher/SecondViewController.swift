//
//  SecondViewController.swift
//  Bird Watcher
//
//  Created by Devin Suttles on 7/13/18.
//  Copyright © 2018 Devin Suttles. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController
{

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var fact1: UILabel!
    @IBOutlet weak var fact2: UILabel!
    @IBOutlet weak var birdImage: UIImageView!
    
    var classify = String()
    let run = Executive()
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkClassification(name: "Blackbird")
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //a void function that changes the image & labels on the screen
    func checkClassification(name: String)
    {
        birdImage.image = UIImage(named: name)
        labelName.text = name
        let result = run.checkObj(name: name)
        fact1.text = result.0
        fact2.text = result.1
    }
}
