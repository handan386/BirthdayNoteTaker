//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Handan on 15.12.2023.
//



//name ve bd kısmına değer giricem save e basıcam ve aşağıdaki name ve bd labelında çıkıcak userdefoult ile de veriyi saklayıp kaydedicem

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var BdField: UITextField!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var BdLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedbirthday = UserDefaults.standard.object(forKey: "birthday")
        
        
        //casting as? olursa bu şekilde kaydet, as! kesin olarak string olarak çevir
        
        if let newName = storedName as? String {
            NameLabel.text = newName
        }
        
        if let newBirthday = storedbirthday as? String {
            BdLabel.text = newBirthday
        }
        
    }
        
       @IBAction func SaveClicked(_ sender: Any) {
            
            UserDefaults.standard.set(NameField.text!, forKey: "name" ) //veri tabanına kaydetmek için
            
            UserDefaults.standard.set(BdField.text!, forKey: "birthday")
            
            NameLabel.text = "Name: \(NameField.text!)"
            BdLabel.text = "Birthday: \(BdField.text!)"
        }
    
    
   //delete etmek
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedbirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            NameLabel.text = "name: "
        }
        
        if (storedbirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            BdLabel.text = "birthday: "
        }
        
    }
    
        
    }

