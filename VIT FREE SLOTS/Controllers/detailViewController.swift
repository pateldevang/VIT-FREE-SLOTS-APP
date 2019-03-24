//
//  detailViewController.swift
//  VIT FREE SLOTS
//
//  Created by Devang Patel on 23/03/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase
var hi1:[String]=[]
var arr1:[String] = []
class detailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tab1: UITableView!
    

    
    var myString : String?
    var handle1: DatabaseHandle?
    var ref1 : DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        hi1 = []
        arr1 = []
        self.tab1.reloadData()
        ref1 = Database.database().reference()
        handle1 = ref1?.child("SJT/Day").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String{
//
//                for child in snapshot.children {
//                    let snap = child as! DataSnapshot
//                    let key = snap.key
//                    let value = snap.value
//                    print("key = \(key)  value = \(value!)")
//                }
                arr1.append(item)
                hi1 = Array(arr1)
                self.tab1.reloadData()
            }
        })
//        ref1?.observeSingleEvent(of: .value, with: { (snapshot) in
//            for child in snapshot.children {
//                let snap = child as! DataSnapshot
//                let value = snap.value as! NSDictionary
//                print("Fuck")
//                let v = value["ground"] as! NSDictionary
//                print(v["G01"] as Any)
//                break
//            }
//        })
        print(myString!)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hi1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = hi1[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "goc", sender: nil)
    }
    
    @IBAction func bac(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        hi2 = []
        arr2 = []
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
