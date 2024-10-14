//
//  StudentViewController.swift
//  Aug_24_ContainerViews_Demo
//
//  Created by Vishal Jagtap on 14/10/24.
//

import UIKit

class StudentViewController: UIViewController {

    
    @IBOutlet weak var studentTableView: UITableView!
    var reuseIdentifierForCell = "StudentTableViewCell"
    var reuseIdentifierForStudentViewController = "StudentDetailsViewController"
    var studentNames = ["Suhaan", "Aniket", "Meghaa", "Pallavi", "Komal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        registerXIBWithTableView()
    }
    
    func initializeViews(){
        studentTableView.delegate = self
        studentTableView.dataSource = self
    }
    
    func registerXIBWithTableView(){
        let uiNib = UINib(nibName: reuseIdentifierForCell, bundle: nil)
        self.studentTableView.register(uiNib, forCellReuseIdentifier: reuseIdentifierForCell)
    }
}


extension StudentViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTableViewCell = self.studentTableView.dequeueReusableCell(withIdentifier: reuseIdentifierForCell, for: indexPath) as! StudentTableViewCell
        
        studentTableViewCell.studentNameLabel.text = studentNames[indexPath.row]
        
        return studentTableViewCell
    }
}

extension StudentViewController : UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let studentDetailsTableViewController = self.storyboard?.instantiateViewController(withIdentifier: reuseIdentifierForStudentViewController) as! StudentDetailsViewController
        
        navigationController?.pushViewController(studentDetailsTableViewController, animated: true)
    }
}
