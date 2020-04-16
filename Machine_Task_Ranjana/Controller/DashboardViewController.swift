//
//  DashboardViewController.swift
//  Machine_Task_Ranjana
//
//  Created by Ranjana Sharma on 15/04/20.
//  Copyright © 2020 Ranjana Sharma. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  navigationController?.navigationBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func createEmployees(_ sender: Any) {
    let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
           let dashboardVc = storyBoard.instantiateViewController(identifier: "CreateEmployeeViewController")as! CreateEmployeeViewController
           navigationController?.pushViewController(dashboardVc, animated: true)
    }
    
    @IBAction func getEmployeesList(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let dashboardVc = storyBoard.instantiateViewController(identifier: "EmployeesTableViewController")as! EmployeesTableViewController
        navigationController?.pushViewController(dashboardVc, animated: true)
    }
}
