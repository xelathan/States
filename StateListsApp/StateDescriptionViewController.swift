//
//  StateDescriptionViewController.swift
//  StateListsApp
//
//  Created by Alex Tran on 10/26/20.
//

import UIKit

class StateDescriptionViewController: UIViewController {
    @IBOutlet weak var stateName: UILabel!
    @IBOutlet weak var stateFlag: UIImageView!
    @IBOutlet weak var stateSeal: UIImageView!
    @IBOutlet weak var statePopulation: UILabel!
    @IBOutlet weak var stateCapital: UILabel!
    @IBOutlet weak var stateBiggestCity: UILabel!
    @IBOutlet weak var stateAbbreviation: UILabel!
    @IBOutlet weak var stateArea: UILabel!
    @IBOutlet weak var flagsealBG: UIView!
    @IBOutlet weak var viewOnMapButton: UIButton!
    
    var name: String!
    var flag: UIImage!
    var seal: UIImage!
    var abbr: String!
    var population: String!
    var capital: String!
    var biggestcity: String!
    var area:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        

        // Do any additional setup after loading the view.
        
        stateName.lineBreakMode = NSLineBreakMode.byWordWrapping
        stateName.numberOfLines = 0
        stateName.font = UIFont(name: "SnellRoundhand-Bold", size: 40)
        stateName.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        stateName.textColor = .white
        stateAbbreviation.lineBreakMode = NSLineBreakMode.byWordWrapping
        stateAbbreviation.numberOfLines = 0
        stateAbbreviation.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        stateAbbreviation.textColor = .white
        statePopulation.lineBreakMode = NSLineBreakMode.byWordWrapping
        statePopulation.numberOfLines = 0
        statePopulation.font = UIFont(name: "SnellRoundhand-Bold", size: 30)
        statePopulation.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        statePopulation.textColor = .white
        stateCapital.lineBreakMode = NSLineBreakMode.byWordWrapping
        stateCapital.numberOfLines = 0
        stateCapital.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        stateCapital.textColor = .white
        stateCapital.font = UIFont(name: "SnellRoundhand-Bold", size: 30)
        stateBiggestCity.lineBreakMode = NSLineBreakMode.byWordWrapping
        stateBiggestCity.numberOfLines = 0
        stateBiggestCity.font = UIFont(name: "SnellRoundhand-Bold", size: 30)
        stateBiggestCity.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        stateBiggestCity.textColor = .white
        stateArea.font = UIFont(name: "SnellRoundhand-Bold", size: 30)
        stateArea.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        stateArea.textColor = .white
        
        flagsealBG.layer.borderColor = UIColor.black.cgColor
        flagsealBG.layer.borderWidth = 3.0
        flagsealBG.layer.cornerRadius = 10;
        flagsealBG.layer.masksToBounds = true;
        flagsealBG.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        viewOnMapButton.backgroundColor = #colorLiteral(red: 0.03490576893, green: 0.1723082364, blue: 0.2608429193, alpha: 1)
        
        self.stateName.text = self.name
        //self.stateName.font = UIFont(name: "Zapfino", size: 20)
        self.stateFlag.image = self.flag
        self.stateSeal.image = self.seal
        self.stateAbbreviation.text = self.abbr
        self.statePopulation.text = "Population: " + self.population
        self.stateCapital.text = "Capital: " + self.capital
        self.stateBiggestCity.text = "Largest City: " + self.biggestcity
        self.stateArea.text = "Area: " + area
        
        //rounding image borders
        stateFlag.layer.cornerRadius = stateFlag.frame.size.width / 4
        stateFlag.clipsToBounds = true
        stateFlag.layer.masksToBounds = true
        
        stateSeal.layer.cornerRadius = stateSeal.frame.size.width / 4
        stateSeal.clipsToBounds = true
        stateSeal.layer.masksToBounds = true
        
        //fly in animation
        var rotationTranformation : CATransform3D = CATransform3DIdentity
        rotationTranformation = CATransform3DTranslate(rotationTranformation, -250, -250, 0)
        
        stateFlag.layer.transform = rotationTranformation
        stateSeal.layer.transform = rotationTranformation
        
        UIView.animate(withDuration: 2, animations: {
            self.stateSeal.layer.transform = CATransform3DIdentity
            self.stateFlag.layer.transform = CATransform3DIdentity
        })
        
        //fade animation
        stateName.alpha = 0.5
        stateAbbreviation.alpha = 0.5
        statePopulation.alpha = 0.5
        stateCapital.alpha = 0.5
        stateBiggestCity.alpha = 0.5
        stateArea.alpha = 0.5
        
        UIView.animate(withDuration: 2, animations: {
            self.stateName.alpha = 1
            self.stateAbbreviation.alpha = 1
            self.statePopulation.alpha = 1
            self.stateCapital.alpha = 1
            self.stateBiggestCity.alpha = 1
            self.stateArea.alpha = 1
        })
        
        viewOnMapButton.layer.cornerRadius = 6
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "mapsegue" {
            let mapVC = segue.destination as! MapViewController
            mapVC.StateName = name
        }
    }


}
