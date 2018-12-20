//
//  Bird.swift
//  Bird Watcher
//
//  Created by Devin Suttles on 7/24/18.
//  Copyright © 2018 Devin Suttles. All rights reserved.
//

import Foundation
class BirdClassification
{
    private var m_name:String?
    private var m_fact:String?
    private var m_fact2:String?
    
    init(name:String,fact:String,fact2:String)
    {
        m_name = name
        m_fact = fact
        m_fact2 = fact2
    }
    
    func getName()->String
    {
        if(m_name == nil)
        {
            return "No value for name"
        }
        return m_name!
    }
    
    func getFact()->String
    {
        if(m_fact == nil)
        {
            return "No value for fact 1"
        }
        return m_fact!
    }
    
    func getFact2()->String
    {
        if(m_fact2 == nil)
        {
            return "No value for fact 2"
        }
        return m_fact2!
    }
}
