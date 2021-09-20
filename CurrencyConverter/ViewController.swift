//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Tolga Sayan on 20.06.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func getratesClicked(_ sender: Any) {
        
        //1.step Request Session
        //2.step Response / Get Data
        //3.step Parsing / JSON Serialization
        
        //1.
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=858b35ec87a4bdf4b834391d56f6a701")
        
        let session = URLSession.shared
        //Closure
        let task = session.dataTask(with: url!) { Data, Response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                //2.
                
                if Data != nil {
                    do{
                   let jsonResponse =  try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                      
                        //ASYNC
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                    
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                    
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                    
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                    
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                    
                                }
                                if let trY = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(trY)"
                                    
                                }
                                
                            }
                        }
                        
                    } catch {
                        print("error")
                    }
                
            }
        }
        
        
    }
    
        task.resume()

}
}


