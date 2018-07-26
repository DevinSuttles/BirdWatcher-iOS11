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
    
    //include a machine learning semantics api or usi a data base to display info
    
    @IBOutlet weak var birdImage: UIImageView!
    
    //might need to use this ?????????
    var objectArray = [Bird]()
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        checkClassification(name: classify)
        createObjs()
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //function that changes the image & label on the screen
    func checkClassification(name: String)
    {
        birdImage.image = UIImage(named: name)
         labelName.text = classify
    }
    
    //function that reads in a text file and appends new bird objects to the array
    func createObjs()
    {
        objectArray.append(Bird(name: "Blackbird", fact: "It is omnivorous, eating a wide range of insects", fact2: "There are 26 different species"))
        objectArray.append(Bird(name: "Blue", fact: "The blue jay is a passerine bird in the family Corvidae", fact2: "It mainly feeds on nuts and seeds "))
        objectArray.append(Bird(name: "Cardinal", fact: "It can be found in southern Canada through the eastern United States from Maine to Texas", fact2: "It has distinctive crest on the head and a mask on the face which is black in the male and gray in the female"))
        objectArray.append(Bird(name: "Chickadee", fact: "they are at least 2.4 to 5.5 inches in size", fact2: "They are apart of the tit family"))
        objectArray.append(Bird(name: "Crow", fact: "The term corw is used as part of the common name of many species", fact2: "More broadly it is a synonym for all of Corvus"))
        objectArray.append(Bird(name: "Goldfinch", fact: "It total mass is 0.48 oz", fact2: "It is the state bird of Iowa and New Jersey"))
        objectArray.append(Bird(name: "Grackle", fact: "The grackle is in the ictarid family", fact2: "They are natives to North and South America"))
        objectArray.append(Bird(name: "Hawk", fact: "The hawk main pray is small mammals", fact2: "They can have a wing span from 3ft 7in to 4ft 8in"))
    }
    
    //tell me the infromation about each bird based on classification
    
}
