//
//  Executive.swift
//  Bird Watcher
//
//  Created by Devin Suttles on 8/22/18.
//  Copyright © 2018 Devin Suttles. All rights reserved.
//

import Foundation

class Executive
{
    //created objectArray of birds and stored them in a Dictionary
    private var objectArray = [BirdClassification]()
    private var dict = [String:BirdClassification]()
    
    init()
    {
        objectArray.append(BirdClassification(name: "Blackbird", fact: "It is omnivorous, eating a wide range of insects", fact2: "There are 26 different species"))
        objectArray.append(BirdClassification(name: "Blue", fact: "The blue jay is a passerine bird in the family Corvidae", fact2: "It mainly feeds on nuts and seeds "))
        objectArray.append(BirdClassification(name: "Cardinal", fact: "It can be found in southern Canada through the eastern United States from Maine to Texas", fact2: "It has distinctive crest on the head and a mask on the face which is black in the male and gray in the female"))
        objectArray.append(BirdClassification(name: "Chickadee", fact: "they are at least 2.4 to 5.5 inches in size", fact2: "They are apart of the tit family"))
        objectArray.append(BirdClassification(name: "Crow", fact: "The term corw is used as part of the common name of many species", fact2: "More broadly it is a synonym for all of Corvus"))
        objectArray.append(BirdClassification(name: "Goldfinch", fact: "It total mass is 0.48 oz", fact2: "It is the state bird of Iowa and New Jersey"))
        objectArray.append(BirdClassification(name: "Grackle", fact: "The grackle is in the ictarid family", fact2: "They are natives to North and South America"))
        objectArray.append(BirdClassification(name: "Hawk", fact: "The hawk main pray is small mammals", fact2: "They can have a wing span from 3ft 7in to 4ft 8in"))
        objectArray.append(BirdClassification(name: "Juncos", fact: "Systematics are still confusing after decades of research, with various authos accepting between three and twelve species", fact2:"In winter they often forage in flocks"))
        objectArray.append(BirdClassification(name: "Mallard", fact: "The Mallard is a dabbling duck that breeds throughout the temperate and subtropical Americas", fact2: "It can be found in Eurassia, and North Africa"))
        objectArray.append(BirdClassification(name: "Mockingbird", fact: "Mockingbird are a group of New World passerine birds from the Mimidae family", fact2: "They are best known for the habit of some species mimicking the songs of other birds"))
        objectArray.append(BirdClassification(name: "Robin", fact: "The robin is a migratory songbird of the true thrush denus and Turdidae, the wider thrush family", fact2: "It is active mostly during the day and assembeles in large flocks at night"))
        objectArray.append(BirdClassification(name: "Woodpecker", fact: "Most species live in forests or woodland habitats, although a few species are known that live in treeless areas", fact2: "They mostly forage for insect prey on the trunks and branches of trees"))
    
        for i in objectArray
        {
            dict.updateValue(i, forKey: i.getName())
        }
    
    }
    //function that checks if the object is inside the dictionary
    func checkObj(name:String)->(String,String)
    {
        guard let fact1 = dict[name]?.getFact()else{return ("No value for fact 1","No value for fact 2")}
        guard let fact2 = dict[name]?.getFact2()else{return ("No value for fact 1","No value for fact 2")}
        return (fact1,fact2)
    }
}
