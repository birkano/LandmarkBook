//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Birkan Pusa on 30.11.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //data
        
        landmarkNames.append("Istanbul")
        landmarkNames.append("Ankara")
        landmarkNames.append("Eskisehir")
        landmarkNames.append("Antalya")
        
        
        landmarkImages.append(UIImage(named: "istanbul")!)
        landmarkImages.append(UIImage(named: "ankara")!)
        landmarkImages.append(UIImage(named: "eskisehir")!)
        landmarkImages.append(UIImage(named: "antalya")!)

        //navigasyona title ekledik
        navigationItem.title = "Landmark project"

    }
    
    //silme fonksiyonu
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
                                                      
        }
    }

    //hucreler
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    //kac sira olacak
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    //diger sayfaya gecis icin fonksiyonu yazdik, identifier'ini gosterdik
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //secilen isim ve gorselin numarasini alip ona gore veri gonderdik
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toimageViewController", sender: nil)
    }
    
    //ikinci sayfaya veri gonderme
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toimageViewController" {
        let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            destinationVC.selectedLandmarkName = chosenLandmarkName
    }
    
}

}
