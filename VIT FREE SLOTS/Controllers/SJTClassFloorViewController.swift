//
//  SJTClassFloorViewController.swift
//  VIT FREE SLOTS
//
//  Created by Devang Patel on 03/02/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class SJTClassFloorViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let a: Array = ["Ground Floor","First Floor","Second Floor","Third Floor","Fourth Floor","Fifth Floor","Sixth Floor","Seventh Floor","Eigth Floor"]
    

    @IBOutlet weak var tab: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = a[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        performSegue(withIdentifier: "go", sender: Any?.self)
    }
    
    @IBAction func b(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
