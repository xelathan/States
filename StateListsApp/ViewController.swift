//
//  ViewController.swift
//  StateListsApp
//
//  Created by Alex Tran on 10/26/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameBackground: UIView!
    
    @IBOutlet weak var ageInfo: UILabel!
    @IBOutlet weak var ageBG: UIView!
    @IBOutlet weak var ageBG2ndLayer: UIView!
    
    @IBOutlet weak var genderBG: UIView!
    @IBOutlet weak var genderBG2ndLayer: UIView!
    @IBOutlet weak var genderInfo: UILabel!
    
    @IBOutlet weak var fromBG: UIView!
    @IBOutlet weak var fromBG2ndLayer: UIView!
    @IBOutlet weak var fromInfo: UILabel!
    
    @IBOutlet weak var hobbyBG: UIView!
    @IBOutlet weak var devImgOuterbox: UIView!
    
    @IBOutlet weak var hobbyBG2ndLayer: UIView!
    @IBOutlet weak var hobbyInfo: UILabel!
    
    @IBOutlet weak var image: UIImageView!
   
    var name: String!
    var age: String!
    var gender: String!
    var from: String!
    var hobby: String!
    
    @IBOutlet weak var smileIcon: UIImageView!
    @IBOutlet weak var calendarIcon: UIImageView!
    @IBOutlet weak var personIcon: UIImageView!
    @IBOutlet weak var buildingIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        image.layer.borderWidth = 5
        image.layer.borderColor = UIColor.white.cgColor
        
        devImgOuterbox.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        nameLabel.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        nameLabel.textColor = .white
        
        nameLabel.text = name
        ageInfo.text = age
        genderInfo.text = gender
        fromInfo.text = from
        hobbyInfo.text = hobby
        
        nameLabel.layer.borderWidth = 0
        nameLabel.layer.cornerRadius = 6

        nameLabel.layer.masksToBounds = true
        
        nameBackground.layer.shadowColor = UIColor.black.cgColor
        nameBackground.layer.shadowOpacity = 0.5
        nameBackground.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        nameBackground.layer.shadowRadius = 10
        
        nameBackground.layer.cornerRadius = 6
        nameBackground.clipsToBounds = false
        
        
        ageBG2ndLayer.layer.masksToBounds = true
        ageBG2ndLayer.layer.cornerRadius = 6
        ageBG2ndLayer.layer.borderWidth = 0
        
        ageBG.layer.masksToBounds = false
        ageBG.layer.shadowColor = UIColor.black.cgColor
        ageBG.layer.shadowOpacity = 0.5
        ageBG.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        ageBG.layer.shadowRadius = 10
        ageBG.layer.cornerRadius = 6
        
        
        genderBG2ndLayer.layer.masksToBounds = true
        genderBG2ndLayer.layer.cornerRadius = 6
        genderBG2ndLayer.layer.borderWidth = 0
        
        genderBG.layer.masksToBounds = false
        genderBG.layer.shadowColor = UIColor.black.cgColor
        genderBG.layer.shadowOpacity = 0.5
        genderBG.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        genderBG.layer.shadowRadius = 10
        genderBG.layer.cornerRadius = 6
        
        fromBG2ndLayer.layer.masksToBounds = true
        fromBG2ndLayer.layer.cornerRadius = 6
        fromBG2ndLayer.layer.borderWidth = 0
        
        fromBG.layer.masksToBounds = false
        fromBG.layer.shadowColor = UIColor.black.cgColor
        fromBG.layer.shadowOpacity = 0.5
        fromBG.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        fromBG.layer.shadowRadius = 10
        fromBG.layer.cornerRadius = 6
        
        hobbyBG2ndLayer.layer.masksToBounds = true
        hobbyBG2ndLayer.layer.cornerRadius = 6
        hobbyBG2ndLayer.layer.borderWidth = 0
        
        hobbyBG.layer.masksToBounds = false
        hobbyBG.layer.shadowColor = UIColor.black.cgColor
        hobbyBG.layer.shadowOpacity = 0.5
        hobbyBG.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        hobbyBG.layer.shadowRadius = 10
        hobbyBG.layer.cornerRadius = 6
        
        //Icon Animations
        var rotationTransform : CATransform3D = CATransform3DIdentity
        rotationTransform = CATransform3DTranslate(rotationTransform, -250, -250, 0)
        smileIcon.layer.transform = rotationTransform
        buildingIcon.layer.transform = rotationTransform
        calendarIcon.layer.transform = rotationTransform
        personIcon.layer.transform = rotationTransform
        
        UIView.animate(withDuration: 1.5, animations: {
            self.smileIcon.layer.transform = CATransform3DIdentity
            self.buildingIcon.layer.transform = CATransform3DIdentity
            self.calendarIcon.layer.transform = CATransform3DIdentity
            self.personIcon.layer.transform = CATransform3DIdentity
        })
    }


}

