//
//  ViewController.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 17.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import UIKit
import Alamofire
import CryptoKit
 

class HomeViewController: UIViewController {
    //outlets
    @IBOutlet weak var collectionViewCharacters: UICollectionView!
    
    // variables
    var myCharacters = [Character]()

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiService.delegate = self
        collectionViewInıt()
       apiStart()
      //  getRequestAPICall()
        // Do any additional setup after loading the view.
    }
    
    func getRequestAPICall()  {
        let params = ["ts" : "1","hash": "c698c665b792dab6a766465f579d640d"]
        let publickey = "d3df83bf5d2fc22cf26d94615abfd7ef"
        let privatekey = "ba42b0357535e0844e66010314bb9b91706ef8c0"
    
        Alamofire.request(Constants.API + Constants.characters + Constants.apiKey, method: .get,parameters: params, encoding: JSONEncoding.default)
        .responseJSON { response in
            print(response.result.value)
            
            }
    }
 
    
      override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)
           self.navigationController?.navigationBar.isHidden = true
           
    
         }
    func  apiStart(){
          ApiService.getCasesForHead()
 
          
      }
    func collectionViewInıt() {
           
           collectionViewCharacters.delegate = self
           collectionViewCharacters.dataSource = self
           let nib = UINib(nibName: "CharacterCell", bundle: nil)
           collectionViewCharacters.register(nib, forCellWithReuseIdentifier: "characterCell")
 
           
           
         

           
       }
    func pushVC(ViewControllerIdentifier: String,senderItems: Any?){
             let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
             let newViewController = storyBoard.instantiateViewController(withIdentifier: ViewControllerIdentifier)
             newViewController.modalPresentationStyle = .fullScreen
             if let detailVC =  newViewController as? DetailVC {
                 detailVC.receiveItems = senderItems as? Character
             }
             
           self.navigationController?.pushViewController(newViewController, animated: true)
        
         }

}

extension HomeViewController: ApiServiceDelegate {
    func onSuccess(_ response: Any?, _ requestCode: RequestCode) {
        print("hata vermedi1")
        print(response.debugDescription)
        print(response)
        let myresponse = response as! CharacterObject
         for result in myresponse.data!.results! {
            print("aşama2")
            print(result.name)
            print(result.thumbnail?.path)
            print(result.thumbnail?._extension)
            if let name = result.name, let path = result.thumbnail?.path, let _extension = result.thumbnail?._extension {
                let fullPath = "\(path).\(_extension)"
                let ourCharacter = Character(name: name, imageUrl: fullPath)
                          myCharacters.append(ourCharacter)
            }
          

         }
        DispatchQueue.main.async {
                       self.collectionViewCharacters.reloadData()
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

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
         
        return myCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionViewCharacters.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CharacterCell
        let ourCharacter = myCharacters[indexPath.row]
        
        cell.updateUI(cell: ourCharacter)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       
        return CGSize(width: self.collectionViewCharacters.frame.size.width/6, height: collectionViewCharacters.frame.size.height/3)
        
    }
    
 
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
                let ourCharacter = myCharacters[indexPath.row]

        pushVC(ViewControllerIdentifier: Constants.detailStoryboard, senderItems: ourCharacter)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    
    
    
}
