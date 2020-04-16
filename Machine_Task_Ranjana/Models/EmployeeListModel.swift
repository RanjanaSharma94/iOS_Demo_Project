//
//  EmployeeListModel.swift
//  Machine_Task_Ranjana
//
//  Created by Ranjana Sharma on 15/04/20.
//  Copyright © 2020 Ranjana Sharma. All rights reserved.
//

import Foundation
import SwiftyJSON


class EmployeeList : RecordTemplate{

    var data : [EmployeeDetail]!
    var status : String!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    required init(fromDictionary dictionary: [String:Any]){
    super.init(fromDictionary: dictionary)
        status = dictionary["status"] as? String
        data = dictionary["data"] as? [EmployeeDetail]
    }


    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    override func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if data != nil{
        var dictionaryElements = [[String:Any]]()
        for dataElement in data {
            dictionaryElements.append(dataElement.toDictionary())
        }
        dictionary["data"] = dictionaryElements
        }
        if status != nil{
            dictionary["status"] = status
        }
        return dictionary
    }

}


class EmployeeDetail : RecordTemplate{

    var employeeAge : String!
    var employeeName : String!
    var employeeSalary : String!
    var id : String!
    var profileImage : String!

    
    required init(fromDictionary dictionary: [String:Any]){
        super.init(fromDictionary: dictionary)
        employeeAge = dictionary["employee_age"]as? String
        employeeName = dictionary["employee_name"]as? String
        employeeSalary = dictionary["employee_salary"]as? String
        id = dictionary["id"]as? String
        profileImage = dictionary["profile_image"]as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    override func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if employeeAge != nil{
            dictionary["employee_age"] = employeeAge
        }
        if employeeName != nil{
            dictionary["employee_name"] = employeeName
        }
        if employeeSalary != nil{
            dictionary["employee_salary"] = employeeSalary
        }
        if id != nil{
            dictionary["id"] = id
        }
        if profileImage != nil{
            dictionary["profile_image"] = profileImage
        }
        return dictionary
    }

}

