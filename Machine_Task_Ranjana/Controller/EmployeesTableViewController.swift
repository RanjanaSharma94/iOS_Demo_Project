//
//  EmployeesTableViewController.swift
//  Machine_Task_Ranjana
//
//  Created by Ranjana Sharma on 15/04/20.
//  Copyright © 2020 Ranjana Sharma. All rights reserved.
//

import UIKit
import Alamofire

class EmployeesTableViewController: UITableViewController {

    var employeeListDetail = [EmployeeDetail]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getEmployeeList()
    }
    

    func getEmployeeList(){
        // for this API I was debugging and it took time because i m getting response but here responseData.data is nil
                   let url = "employees"
                   NetworkHelper<EmployeeList>().APICall(url, method: .get, success: { (responseData) in
                    if let data = responseData.data {
                        self.employeeListDetail = data

                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                   }) { (error) in
                       self.showToast(message: error.description)
                   }
           }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return employeeListDetail.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeListTableViewCell", for: indexPath)as! EmployeeListTableViewCell
        cell.labelId.text = employeeListDetail[indexPath.row].id
        cell.labelName.text = employeeListDetail[indexPath.row].employeeName
        cell.labelSalary.text = employeeListDetail[indexPath.row].employeeSalary
        return cell
    }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
