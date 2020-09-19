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
        addShadow()
       
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
    func addShadow() {
        /*
        - shadowColor sets the color of the shadow, and needs to be a CGColor.
        - shadowOpacity sets how transparent the shadow is, where 0 is invisible and 1 is as strong as possible.
        - shadowOffset sets how far away from the view the shadow should be, to give a 3D offset effect.
        - shadowRadius sets how wide the shadow should be.
         */
        self.layer.cornerRadius  = 5.0
        self.layer.masksToBounds = true
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.23
        self.layer.shadowRadius = 4
    }
    func imageLoading(url: String) {
        self.imageView.setImage(with: url)
        
    }
    func updateUI(cell: Character) {
        nameLabel.text =   cell.name
        imageLoading(url: cell.imageUrl)
                
        
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
