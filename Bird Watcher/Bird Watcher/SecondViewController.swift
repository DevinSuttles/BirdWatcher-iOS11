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

   
    var classify = String()
    
    @IBOutlet weak var birdImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        labelName.text = classify

        checkOut(name: classify)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkOut(name: String)
    {
        birdImage.image = UIImage(named: name)
    }
    
}
