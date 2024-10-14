//
//  PlacementViewController.swift
//  Aug_24_ContainerViews_Demo
//
//  Created by Vishal Jagtap on 14/10/24.
//

import UIKit

class PlacementViewController: UIViewController {
    
    @IBOutlet weak var placementTableView: UITableView!
    var reuseIdentifierForCell = "PlacementTableViewCell"
    var reuseIdentiferForPlacementViewController = "PlacementViewController"
    var studentsPlacedNames = [
        PlacedStudents(studentName: "Pallavi", studentCompanyName: "Abc"),
        PlacedStudents(studentName: "Megha", studentCompanyName: "Abc"),
        PlacedStudents(studentName: "Suhaan", studentCompanyName: "Xyz"),
        PlacedStudents(studentName: "Aniket", studentCompanyName: "Xyz")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialzeViews()
        registerXIBWithTableView()
        
    }
    
    func initialzeViews(){
        placementTableView.delegate = self
        placementTableView.dataSource = self
    }
    
    func registerXIBWithTableView(){
        let uiNib = UINib(nibName: reuseIdentifierForCell, bundle: nil)
        self.placementTableView.register(uiNib, forCellReuseIdentifier: reuseIdentifierForCell)
    }
}

extension PlacementViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentsPlacedNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let placementTableViewCell = self.placementTableView.dequeueReusableCell(withIdentifier: reuseIdentifierForCell, for: indexPath) as! PlacementTableViewCell
        
        placementTableViewCell.placedStudentNameLabel.text = studentsPlacedNames[indexPath.row].studentName
        placementTableViewCell.placedStudentCompanyNameLabel.text = studentsPlacedNames[indexPath.row].studentCompanyName
        
        return placementTableViewCell
    }
}

extension PlacementViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
