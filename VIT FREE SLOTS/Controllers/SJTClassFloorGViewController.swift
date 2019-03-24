//
//  SJTClassFloorGViewController.swift
//  VIT FREE SLOTS
//
//  Created by Devang Patel on 03/02/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase
var hi:[String]=[]
var arr:[String] = []

class SJTClassFloorGViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var handle: DatabaseHandle?
    var ref : DatabaseReference?
    var namess : String?

    @IBOutlet weak var tabl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabl.reloadData()
        ref = Database.database().reference()
        handle = ref?.child("SJT/ground/roomno").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String{
                arr.append(item)
                hi = Array(Set(arr)).sorted()
                self.tabl.reloadData()
            }
        })
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = hi[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        namess = hi[indexPath.row]
//         performSegue(withIdentifier: "go1", sender: Any?.self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "go1"{
            let de = segue.destination as! detailViewController
            de.myString = namess ?? "G01"
            hi2 = []
            arr2 = []
        }
    }

    
    @IBAction func ba(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
