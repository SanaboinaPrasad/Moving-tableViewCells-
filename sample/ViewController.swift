//
//  ViewController.swift
//  sample
//
//  Created by Sriram Prasad on 14/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var editBurron: UIBarButtonItem = {
        let button = UIBarButtonItem()
        return button
    }()
    var typesooftransport = ["Two Wheeler","Four Wheeler","3 wheeler","6 Wheeler","8 wheeler"]
    var twowheeler = ["Bicycle","scooter","heroHonda","pept","Vego","Honda Activa"]
    var threeWheeler = ["Riksha","Auto","Loading Riksha"]
    var fourWheeler = ["Bus","Van","lorry","car","MetaDoor"]
    var sixWheeler = ["Lorry","Tipper","Heavy lorry","SandCarrying lorry"]
    var eigthWheelers = ["Crain Loory","Heavy Loading Lorry ","Cranes"]
    var totalarraies =  [Array<Any>]()
    override func viewDidLoad() {
        super.viewDidLoad()
        totalarraies = [twowheeler,threeWheeler,fourWheeler,sixWheeler,eigthWheelers]
        editBurron = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEdit))
        navigationItem.rightBarButtonItem = editBurron
        
        tableView.register(Samplecell.self, forCellReuseIdentifier: "cell")
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return typesooftransport.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalarraies[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Samplecell
        
        cell.textLabel?.text = totalarraies[indexPath.section][indexPath.row] as! String
        return cell
        
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return typesooftransport[section]
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .red
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = .white
    }
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            totalarraies[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let items = totalarraies[sourceIndexPath.row]
        totalarraies.remove(at: sourceIndexPath.row)
        totalarraies.insert(items, at: destinationIndexPath.row)
    }
    
    
    @objc  func handleEdit(){
    if tableView.isEditing ==  false {
            tableView.isEditing = true
        }
    else {
        tableView.isEditing = false
        }
    }
    
}





class Samplecell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
