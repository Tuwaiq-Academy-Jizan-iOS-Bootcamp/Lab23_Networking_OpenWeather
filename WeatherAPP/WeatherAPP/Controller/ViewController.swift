//
//  ViewController.swift
//  WeatherAPP
//
//  Created by يوسف جابر المالكي on 16/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameCityTextField: UITextField!
    @IBOutlet weak var searchCityBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCityBtn.layer.cornerRadius = 6
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        nameCityTextField.text = ""
    }
    
    @IBAction func searchCity(_ sender: UIButton) {
        
        let city = nameCityTextField.text ?? ""
        
        if city.isEmpty {
            
            let alert = UIAlertController(title: "تنبية!", message: "الرجاء ادخال اسم المدينة", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "الغاء", style: .cancel, handler: nil)
            
            alert.addAction(cancelButton)
            
            self.present(alert, animated: true, completion: nil)
            
        }else {
            
            let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
            
            vc.city = city
            
            self.show(vc, sender: nil)
            
        }
        
        
        
    }
    
    
}


