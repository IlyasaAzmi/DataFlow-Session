//
//  ViewController.swift
//  DataFlow-Session
//
//  Created by Ilyasa Azmi on 16/05/19.
//  Copyright © 2019 Ilyasa Azmi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    @IBAction func registerPressed(_ sender: Any) {
        if fullName.text == "" || phone.text == "" {
            let alert = UIAlertController(title: "Error", message: "Must be filled", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (alertAction) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "toConfirmPage", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            ConfirmViewController{
            destination.fullName = fullName.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.delegate = self
        phone.delegate = self
    }
}

extension ViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fullName {
            phone.becomeFirstResponder()
        } else if textField == phone {
            textField.resignFirstResponder()
        }
        return true
    }
}
