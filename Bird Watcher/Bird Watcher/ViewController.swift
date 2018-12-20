//
//  ViewController.swift
//  Bird Watcher
//
//  Created by Devin Suttles on 6/17/18.
//  Copyright © 2018 Devin Suttles. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVCapturePhotoCaptureDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var recgonize = String()
    //segue information from one view to the next
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let secondView = segue.destination as! SecondViewController
        secondView.classify = recgonize
    }
}
