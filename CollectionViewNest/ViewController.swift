//
//  ViewController.swift
//  CollectionViewNest
//
//  Created by 中山龍 on 2022/06/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!

    var categoryArray = ["プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語", "プログラミング言語"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let nib = UINib(nibName: "ListCollectionViewCell", bundle: .main)
        categoryCollectionView.register(nib, forCellWithReuseIdentifier: "CategoryCell")

        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! ListCollectionViewCell
        cell.titleLabel.text = categoryArray[indexPath.row]
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellWidth = Int(UIScreen.main.bounds.width)
        var cellHeight = 100
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10/2, bottom: 0, right: 10/2)
    }

}

