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
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
   
    var classify = String()
    
    
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
        switch name
        {
        case "Blackbird":
            label1.text = "Both sexes are territorial on the breading grounds"
            label2.text = "They are known to be omnivorous"
        case "Blue Jay":
            label1.text = "It breeds in both deciduous and coniferous forests"
            label2.text = "Both sexes are similar in size"
        case "Cardinal":
            label1.text = "They are also known as cardinal-grosbeaks"
            label2.text = "Cardinals can suppress the West Nile virus upon infection"
        case "Chickadee":
            label1.text = "They are small-sized birds overall, usually having the crown of the head"
            label2.text = "The Chickadee belongs to the tit family"
        case "Crow":
            label1.text = "The term crow is used as part of the common name of many species"
            label2.text = "Scavengers"
        case "Goldfinch":
            label1.text = "They range from mid-Alberta to North Carolina"
            label2.text = "The male displays brightly colored plumage during the breeding season"
        case "Grackle":
            label1.text = "It breeds in both deciduous and coniferous forests"
            label2.text = "Adult males have black or mostly black plumage"
        case "Hawk":
            label1.text = "It is most often a predator of small mammals "
            label2.text = "It's legally protected"
        case "Juncos":
            label1.text = "Common across much of temperate North America"
            label2.text = "Males tend to have darker, more conspicuous markings than the females"
        case "Mallard":
            label1.text = "This duck belongs to the subfamily Anatinae of the waterfowl family"
            label2.text = "The female lays eight to thirteen creamy white to greenish-buff spotless eggs"
        case "Mockingbird":
            label1.text = "It breeds in both deciduous and coniferous forests"
            label2.text = "There are about 17 species in three genera"
        case "Robin":
            label1.text = "The robin is active mostly during the day"
            label2.text = "The robin is widely distributed throughout North America"
        case "Woodpecker":
            label1.text = "They mostly nest and roost in holes that they excavate in tree trunks"
            label2.text = "Almost 20 species are threatened to extinction"
        default:
            break
        }
    }

}
