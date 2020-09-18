//
//  DetailVCViewController.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 17.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    // outlets
    @IBOutlet weak var comicsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    // variables
    var receiveItems: Character? {
        didSet {
            updateView()
        }
    }
    
    var comics: [String?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiService.delegate = self
        updateView()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    func updateView(){
        
        if let detail = receiveItems {
            if let name = nameLabel, let imageView = imageView, let description = descriptionLabel, let comics = comicsLabel {
                
                imageView.setImage(with: detail.imageUrl)
                name.text =     detail.name
                print("ok name \(detail.name)")
                print("ok description \(detail.description)")
                print("ok imageUrl \(detail.imageUrl)")
                print(detail.id)
                getComics(id: detail.id)
                AnalyticsManager.Instance.sendEventsForAllAnalytics(eventName: "Detail_character_name", parameter: ["characterName": detail.name])
                
                guard let descr = detail.description else {
                    return
                }
                
                description.text =  descr
                
                
                
                
                
            }
            
        }
        
    }
    
    func getComics(id: Int) {
        let dateDetails =  sendingDateDetails()
        print(dateDetails)
        ApiService.getComicsDetail(withCharacterId: id,sendingDate: dateDetails)
         
    }
    func sendingDateDetails()  -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDate = formatter.string(from: date)
        
        let since2005Date = "2005-01-01"
        
        return  "\(since2005Date),\(currentDate)"
        
        
    }
    @IBAction func favoriteButtonClicked(_ sender: UIButton) {
        
        if   sender.isSelected {
            sender.setImage(UIImage(named: "favorite")?.withRenderingMode(.alwaysTemplate), for: UIControl.State.normal)
            addFavorite()
            sender.tintColor = UIColor.red
            sender.isSelected = false
            
        } else {
            sender.setImage(UIImage(named: "favorite")?.withRenderingMode(.alwaysTemplate), for: UIControl.State.normal)
            sender.tintColor = UIColor.white
            sender.isSelected = true
            
            
        }
        
    }
    func addFavorite() {
        var dict =  [String : Any] ()
        dict["name"]  =  receiveItems?.name
        dict["description"]  = receiveItems?.description
        dict["id"]  = receiveItems?.id
        dict["image"]  = receiveItems?.imageUrl
        dict["comics"]  = comics
        
        UserDefaults.standard.setValue(dict, forKey: "key")
        UserDefaults.standard.synchronize()
        
        
        if  let favoriteCharacter = UserDefaults.standard.dictionary(forKey: "key") as? NSDictionary {
            
            print(favoriteCharacter["name"])
            print(favoriteCharacter["comics"])
            
        }
        
        
        
    }
    func addAnimation(){
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
            self.comicsLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.7)
            
        }) { (success) in
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
                self.comicsLabel.transform = .identity
            }, completion: nil)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension DetailVC: ApiServiceDelegate {
    func onSuccess(_ response: Any?, _ requestCode: RequestCode) {
        print("hata vermedi1")
        print(response.debugDescription)
        let myresponse = response as! CharacterObject
        for result in myresponse.data!.results! {
            print("veriler geldi")
            print(result.comicTitle)
            comics.append(result.comicTitle)
            if  let comics = comicsLabel {
                
                
                addAnimation()
                comics.text = (comics.text ?? "") + (result.comicTitle ?? "")
                
            }
            
        }
        
        
    }
    
    func onFailure(_ error: Error?, _ requestCode: RequestCode) {
        if requestCode == .errorState {
            
            if let error = error {
                
                print(error.localizedDescription)
                print(requestCode)
                
            }
            
            
        }
    }
    
    
    
}
