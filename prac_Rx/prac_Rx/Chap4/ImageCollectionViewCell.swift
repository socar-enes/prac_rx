//
//  ImageCollectionViewCell.swift
//  prac_Rx
//
//  Created by enes on 2021/08/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var representedAssetIdentifier: String!

    override func prepareForReuse() {
      super.prepareForReuse()
      imageView.image = nil
    }

    func flash() {
      imageView.alpha = 0
      setNeedsDisplay()
      UIView.animate(withDuration: 0.5, animations: { [weak self] in
        self?.imageView.alpha = 1
      })
    }
}
