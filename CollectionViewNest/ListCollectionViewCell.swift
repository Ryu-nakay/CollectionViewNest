//
//  ListCollectionViewCell.swift
//  CollectionViewNest
//
//  Created by 中山龍 on 2022/06/05.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var oneCategoryCollectionView: UICollectionView!

    var questionArray = ["Swift", "Java", "C++", "JavaScript", "Python", "Ruby"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "HorizontalCollectionViewCell", bundle: .main)
        oneCategoryCollectionView.register(nib, forCellWithReuseIdentifier: "HorizontalCell")

        oneCategoryCollectionView.delegate = self
        oneCategoryCollectionView.dataSource = self


    }

}

extension ListCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCell", for: indexPath) as! HorizontalCollectionViewCell
        cell.titleLabel.text = questionArray[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellWidth = 120
        var cellHeight = 80

        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,left: 10/2,bottom: 0,right: 10/2)
    }
}
