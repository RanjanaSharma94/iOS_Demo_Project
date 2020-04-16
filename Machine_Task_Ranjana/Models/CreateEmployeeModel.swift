//
//  CreateEmployeeModel.swift
//  Machine_Task_Ranjana
//
//  Created by Ranjana Sharma on 15/04/20.
//  Copyright © 2020 Ranjana Sharma. All rights reserved.
//

import Foundation
import SwiftyJSON


class CreateEmployeesModel : RecordTemplate{

    var data : EmployeeData!
    var status : String!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    
    required init(fromDictionary dictionary: [String:Any]){
       super.init(fromDictionary: dictionary)
           status = dictionary["status"] as? String
          data = dictionary["data"] as? EmployeeData
       }
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
   override func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if data != nil{
            dictionary["data"] = data.toDictionary()
        }
        if status != nil{
            dictionary["status"] = status
        }
        return dictionary
    }

}

class EmployeeData : RecordTemplate{

var age : String!
var id : Int!
var name : String!
var salary : String!

    
    required init(fromDictionary dictionary: [String:Any]){
        super.init(fromDictionary: dictionary)
        age = dictionary["age"]as? String
        id = dictionary["id"]as? Int
        name = dictionary["name"]as? String
        salary = dictionary["salary"]as? String
    }
/**
 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
 */
    override func toDictionary() -> [String:Any]
{
    var dictionary = [String:Any]()
    if age != nil{
        dictionary["age"] = age
    }
    if id != nil{
        dictionary["id"] = id
    }
    if name != nil{
        dictionary["name"] = name
    }
    if salary != nil{
        dictionary["salary"] = salary
    }
    return dictionary
}

}
