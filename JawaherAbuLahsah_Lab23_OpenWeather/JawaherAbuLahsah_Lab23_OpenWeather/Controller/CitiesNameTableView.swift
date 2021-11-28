//
//  CitiesNameTableView.swift
//  JawaherAbuLahsah_Lab23_OpenWeather
//
//  Created by Jawaher Mohammad on 22/04/1443 AH.
//

import Foundation
import UIKit
class CitiesNameTableView:UIViewController{
    @IBOutlet weak var addCityTextField: UITextField!
    @IBOutlet weak var citiesTableView: UITableView!

    var cities = ["Jizan","Iraq","Reunion","Riyadh","Switzerland","Turkey"]
    var city = ""

    
    @IBAction func addButton(_ sender: UIButton) {
        if let text = addCityTextField.text{
            cities.append(text)
            let indexPath = IndexPath(row: cities.count - 1 , section: 0)
            citiesTableView.beginUpdates()
            citiesTableView.insertRows(at: [indexPath], with: .automatic)
            citiesTableView.endUpdates()
        }
    }
    override func viewDidLoad() {
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = segue.destination as! ViewController
        //sender.city = city
    }
}
extension CitiesNameTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cities[indexPath.row]
        cell.contentConfiguration = content
        cell.accessoryType = .detailButton
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        city = cities[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
}
