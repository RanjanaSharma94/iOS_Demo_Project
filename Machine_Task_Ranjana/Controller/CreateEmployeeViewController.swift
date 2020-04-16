//
//  CreateEmployeeViewController.swift
//  Machine_Task_Ranjana
//
//  Created by Ranjana Sharma on 15/04/20.
//  Copyright © 2020 Ranjana Sharma. All rights reserved.
//

import UIKit

class CreateEmployeeViewController: UIViewController {
    @IBOutlet weak var txtFldSalary: UITextField!
    @IBOutlet weak var txtFldName: UITextField!
    
    @IBOutlet weak var txtFldId: UITextField!
    @IBOutlet weak var txtFldAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func createEmployee(){
        var param = ["name":txtFldName.text ?? "test","salary":txtFldSalary.text ?? "123","age":txtFldAge.text ?? "23"]
                let url = "create"
                NetworkHelper<CreateEmployeesModel>().APICall(url, method: .post, parameters:param, success: { (responseData) in
                    if responseData.status == "success" {
                        self.showToast(message: "Employee Added Successfully")
                    }else if  responseData.status == "failure" {
                        self.showToast(message: "Unable to save data")
                    }
                }) { (error) in
                    self.showToast(message: error.description)
                }
        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addEmployeeButtonTapped(_ sender: Any) {
        createEmployee()
    
    }
    
}

extension UIViewController {

func showToast(message : String) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-150, width: self.view.frame.size.width - 80, height: 42))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = UIFont(name: "Rubik-Regular", size: 16)
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}
}
