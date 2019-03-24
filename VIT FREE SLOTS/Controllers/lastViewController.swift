//
//  lastViewController.swift
//  VIT FREE SLOTS
//
//  Created by Devang Patel on 23/03/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase
var c = ""
var hi2:[String]=[]
var arr2:[String] = []
class lastViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    var handle2: DatabaseHandle?
    var ref2 : DatabaseReference?
    let time = ["8:00 am - 9:00 am","9:00 am - 10:00 am","10:00 am - 11:00 am","11:00 am - 12:00 pm","12:00 pm - 1:00 pm","2:00 pm - 3:00 pm","3:00 pm - 4:00 pm","4:00 pm - 5:00 pm","5:00 pm - 6:00 pm","6:00 pm - 7:00 pm"]
    @IBOutlet weak var tab2: UITableView!
    @IBOutlet weak var cou: UILabel!
    @IBOutlet weak var Step: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        hi2 = []
        arr2 = []
        ref2 = Database.database().reference()
        ref2?.child("SJT/count").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            c = value?["count"] as? String ?? "3"
            if(c >= "60.0")
            {
                let alert = UIAlertController(title: "Notice", message: "The class is full", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert,animated: true,completion: nil)
            }
            self.cou.text = c
            self.Step.value = Double(c)!
            
        }) { (error) in
            print(error.localizedDescription)
        }
        stat()
            self.tab2.reloadData()
    
    }
    
    
    func stat()
    {
         ref2 = Database.database().reference()
        handle2 = ref2?.child("SJT/ground/G01/c").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String{
                arr2.append(item)
                hi2 = Array(arr2)
                print(hi2)
                self.tab2.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hi2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = time[indexPath.row]
        if hi2[indexPath.row] == "green"
        {
        cell.backgroundColor = UIColor.green
        }
        else
        {
            cell.backgroundColor = UIColor.red
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func count(_ sender: UIStepper) {
         ref2 = Database.database().reference()
        self.ref2?.child("SJT/count/count").setValue(String(sender.value))
        cou.text = String(Int(sender.value))
        ref2?.child("SJT/count").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            c = value?["count"] as? String ?? "3"
            if(c >= "60.0")
            {
                let alert = UIAlertController(title: "Notice", message: "The class is full", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert,animated: true,completion: nil)
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    

    @IBAction func bat(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        hi2=[]
        arr2=[]
    }
}
