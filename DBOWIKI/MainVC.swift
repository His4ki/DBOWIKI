//
//  MainVC.swift
//  DBO WIKI
//
//  Created by Kacper Kuźniak on 28/07/2017.
//  Copyright © 2017 Kacper Kuźniak. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var cells = [CellModel]()
    var menuIsMovedUp: Bool = false
    var menuLayoutIsHidden: Bool = false
    
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var dragonballLabel: UILabel!
    @IBOutlet weak var wikiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapUnlockPlaces = CellModel(img: "map", title: "MAP UNLOCK PLACES")
        let flightSystem = CellModel(img: "flight", title: "FLIGHT SYSTEM")
        let petSystem = CellModel(img: "pet", title: "PET SYSTEM")
        let craftSystem = CellModel(img: "craft", title: "CRAFT SYSTEM")
        let adultQuest = CellModel(img: "adult", title: "ADULT QUEST")
        
        appendCellsForMenu(menuCells: mapUnlockPlaces, flightSystem, petSystem, craftSystem, adultQuest)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        menuView.layer.cornerRadius = 15
        
        tableView.alpha = 0
        tableView.separatorColor = UIColor.white
        tableView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalToConstant: CGFloat(cells.count * 100)).isActive = true
        tableView.isScrollEnabled = false
        tableView.layer.cornerRadius = 20
    }
    
    func appendCellsForMenu(menuCells: CellModel...) {
        for cell in menuCells {
            cells.append(cell)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellView {
            
            cell.backgroundColor = UIColor.black.withAlphaComponent(0.1)
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white.withAlphaComponent(0.1)
            cell.selectedBackgroundView = bgColorView
            let myCell = cells[indexPath.row]
            
            cell.updateUI(cellModel: myCell)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "adultQuestVC") {
            let vc = segue.destination as! ContentVC
            vc.logoView = self.logoView
            vc.tableView = self.tableView
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            performSegue(withIdentifier: "adultQuestVC", sender: nil)
            hideMenuLayout()
        }
    }
    
    func hideMenuLayout() {
            UIView.animate(withDuration: 0.3, animations: {
                self.tableView.alpha = 0
                self.logoView.alpha = 0
            })
    }
    
    @IBAction func swipedUp(_ sender: Any) {
        if menuIsMovedUp == false {
            moveMenuUp()
            menuIsMovedUp = true
        }
    }
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        if menuIsMovedUp == false {
            moveMenuUp()
            menuIsMovedUp = true
        }
    }
    
    func moveMenuUp() {
        UIView.animate(withDuration: 0.1, animations: {
            self.menuView.alpha = 0
        })
        UIView.animate(withDuration: 0.4, animations: {
            self.dragonballLabel.alpha = 0
            self.wikiLabel.alpha = 0
            self.tableView.alpha = 1
        })
        UIView.animate(withDuration: 0.6, animations: {
            self.logoView.transform = CGAffineTransform(translationX: 0, y: -180)
            self.tableView.transform = CGAffineTransform(translationX: 0, y: -450)
        })
    }
}

