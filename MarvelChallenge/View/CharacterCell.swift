//
//  CharacterCell.swift
//  MarvelChallenge
//
//  Created by Bartu akman on 17.09.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
          self.layer.cornerRadius  = 5.0
          self.layer.masksToBounds = true
          self.layer.shadowOffset = CGSize(width: 0, height: 0)
          self.layer.shadowColor = UIColor.black.cgColor
          self.layer.shadowOpacity = 0.23
          self.layer.shadowRadius = 4
    }
    override func prepareForReuse() {
           super.prepareForReuse()

           imageView.image = nil
        }
         func imageLoading(url: String) {
          self.imageView.setImage(with: url)

           }
     func updateUI(cell: Character) {
        nameLabel.text =   cell.name
        imageLoading(url: cell.imageUrl)

         //  descriptionDetailLabel.text = "\(cell.proCount) near you"
    
           
       }

    }


extension UIImageView {
    // to use kingFisher library easily
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        var kf = self.kf
        kf.indicatorType = .activity
        
        DispatchQueue.main.async {
            self.kf.setImage(with: resource)

        }

    }
}
