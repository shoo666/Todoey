//
//  TableViewControllerTodoList.swift
//  Todoey
//
//  Created by SEPEHR on 3/6/19.
//  Copyright © 2019 SEPEHR. All rights reserved.
//

import UIKit

class TableViewControllerTodoList: UITableViewController {

    
    var itemArray = ["تماس با جو", "خرید باکس", "خرید قهوه"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source Methods
    //*********************************************
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = itemArray[indexPath.row]

        return cell
    }
    
    // MARK: - Table view Delegate Methods
    //*********************************************
    //vaghti roye cell ha click shod anjam bede
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray [indexPath.row])
        //dar darone table be sorate pishfarz checkmark vojod dare va ma az in tarigh farakhanish mikonim (ba click kardan tik bekhore har cell va agar tik dasht tiko bardar)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //vaghti roye cell ha click mishe click shode namone va be halate ghabl bargarde masalan fanar poshteshe
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Add New Items
    //*********************************************
    //button barae afzodan todo jadid
    @IBAction func addTodoButtonPressed(_ sender: UIBarButtonItem) {
        
        //sakhte 1 moteghayer omomi darone in func baraE inke mohtavaE textfield alert ro begire va vaghti dokme ro zadim namayesh bede
        var textField = UITextField()
        //zamane zadane buttem afzodan alert namayesh bede
        let alert = UIAlertController(title: "افزودن کار جدید", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "افزودن", style: .default) { (action) in
            //what will happen once the user clicks the Add item button on our UIAlert
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        //ejade textfield darone alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "کار جدید"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
