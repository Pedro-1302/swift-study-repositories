//
//  ViewController.swift
//  NameList
//
//  Created by Pedro Franco on 08/08/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var people: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lista de Nomes"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Erro ao consultar dados. \(error)")
        }
    }

    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Novo Perfil", message: "Insira os dados do novo perfil", preferredStyle: .alert)
            
            alert.addTextField { textField in
                textField.placeholder = "Nome"
            }
            
            alert.addTextField { textField in
                textField.placeholder = "Gêneros"
            }
            
            alert.addTextField { textField in
                textField.placeholder = "Cor dos Olhos"
            }
            
            let saveAction = UIAlertAction(title: "Salvar", style: .default) { [unowned self] action in
                guard let nameField = alert.textFields?[0],
                      let genresField = alert.textFields?[1],
                      let eyeColorField = alert.textFields?[2],
                      let name = nameField.text,
                      let genres = genresField.text,
                      let eyeColor = eyeColorField.text else {
                    return
                }
                
                save(name: name, genre: genres, eyeColor: eyeColor) // Updated parameter name
                self.tableView.reloadData()
            }
            
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
            
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
    }
    
    func save(name: String, genre: String, eyeColor: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        person.setValue(name, forKey: "name")
        person.setValue(genre, forKey: "genres") // Updated key
        person.setValue(eyeColor, forKey: "eyecolor") // Updated key
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Erro ao salvar novo nome \(error)")
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let person = people[indexPath.row]
        
        if let name = person.value(forKey: "name") as? String,
           let genres = person.value(forKey: "genres") as? String, // Updated key
           let eyeColor = person.value(forKey: "eyecolor") as? String { // Updated key
            cell.textLabel?.text = "Name: \(name), Genres: \(genres), Eye Color: \(eyeColor)"
        } else {
            cell.textLabel?.text = "Invalid Data"
        }
        
        return cell
    }


}

