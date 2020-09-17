//
//  DetailVCViewController.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 17.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var receiveItems: Character? {
            didSet {
                updateView()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
    }

    
    func updateView(){
        /*
           if let detail = receiveItems {
               if let name = detailNameLabel, let imageView = detailImageView, let pros = prosLabel, let rating = ratingLabel, let jobs = completedJobLabel {
                   
                   imageView.setImage(with: detail.imageUrl)
                   name.text =     detail.name
                   pros.text = "\(detail.proCount)"
                   guard let average = detail.averageRating else {
                       return
                   }
                   
                   rating.text = "\(average)"
                   
                   guard let completedJobs = detail.completedJobsOnLastMonth else {
                                      return
                                  }
                   
                   jobs.text = "Last Month \(completedJobs) cleaning job completed"
                   

               }
               
           }
           */
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
