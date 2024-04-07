//
//  ViewController.swift
//  temp_project
//
//  Created by anshul on 01/04/24.
//

import UIKit

class ViewController: UITableViewController{
    
    var picture = [String]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "Strom Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for i in items {
            if i.hasPrefix("nssl") {
                picture.append(i)
            }
        }
        picture.sort()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picture.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = picture[indexPath.row]
      
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as?
            DetailViewController{
            vc.selectImage = picture[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    
}
