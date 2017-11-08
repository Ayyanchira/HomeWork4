//
//  LoginViewController.swift
//  HomeWork4
//
//  Created by Akshay Ayyanchira on 11/7/17.
//  Copyright © 2017 Akshay Ayyanchira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if usernameTextField.text == "username" && passwordTextField.text == "password"{
            
            let headers = [
                "content-type": "application/json",
                "cache-control": "no-cache",
                "postman-token": "337c2502-d408-122c-b7cb-2d2ef76a69a6"
            ]
            let parameters = [
                "email": "patient5@gmail.com",
                "password": "password"
                ] as [String : Any]
            
            let postData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            
            let request = NSMutableURLRequest(url: NSURL(string: "http://13.58.162.202:5000/loginapi")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData as Data!
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error!)
                } else {
                    let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                    let dict = self.convertToDictionary(text: String(datastring))
                    
                    if let statusCode = dict?["code"] as! Int?{
                        DispatchQueue.main.async {
                            if statusCode == 200{
                                let username = dict?["name"] as! String?
                                let token = dict?["token"] as! String
                                UserDefaults.standard.set(token, forKey: "token")
                                self.performSegue(withIdentifier: "loginSuccessful", sender: username)
                            }
                            else if statusCode == 400{
                                let alert = UIAlertController(title: "Error", message: "Username does not exist", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler:nil))
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                        
                    }
                    
                    print(datastring)
                }
            })
            dataTask.resume()
            //performSegue(withIdentifier: "loginSuccessful", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSuccessful"{
            let welcomeViewController = segue.destination as! WelcomeViewController
            welcomeViewController.username = sender as? String
        }
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
