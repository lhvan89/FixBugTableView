//
//  AttachedFilesTableViewCell.swift
//  FixBugTableView
//
//  Created by Van Le on 11/2/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import UIKit

class AttachedFilesTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    var itemWidth: CGFloat = 10
    var dataSource: [Attachment] = [
        Attachment(
            date: "16-06-2019",
            listItem: [
                Media(type: "photo", url: "https://cdn.hswstatic.com/gif/animal-stereotype-orig.jpg"),
                Media(type: "photo", url: "http://www.globalanimaltransport.com/wp-content/themes/globala/images/slider/6.jpg"),
                Media(type: "photo", url: "https://static.boredpanda.com/blog/wp-content/uploads/2016/07/wild-animal-photography-konsta-punkka-10.jpg"),
                Media(type: "photo", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJHNUtKrxJe_A41GKl5a5rjKZQpoNe_KA1qmeoIj9gihktMEf5Aw&s")
            ]
        ),
        Attachment(
            date: "15-06-2019",
            listItem: [
                Media(type: "photo", url: "https://secure.i.telegraph.co.uk/multimedia/archive/03578/chip--wide_3578582k.jpg"),
                Media(type: "photo", url: "https://www.cityofames.org/Home/ShowImage?id=10850&t=636922367866077470"),
                Media(type: "photo", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSWnnSTgPtGsKf_AIcUQqFiU65qzukN6wM06gwlGWMXJOCNwSjqQ&s"),
                Media(type: "photo", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcHcad8EbT5Ll322zo1O-srnGqUuc92vBRjaGZW8y5C0Tf2bg60A&s"),
                Media(type: "photo", url: "https://api.discovery.com/v1/images/5d856e8f85aeee784356b50d?aspectRatio=16x9&width=1400&key=3020a40c2356a645b4b4")
            ]
        )
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemWidth = (UIScreen.main.bounds.size.width - 48) / 3
        collectionView.register(UINib(nibName: "MediaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MediaCollectionViewCell")
        collectionView.register(UINib(nibName: "SectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeaderView")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        bgView.layer.cornerRadius = 10
        bgView.addShadow()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateHeightContain() {
        let height: CGFloat = collectionView.collectionViewLayout.collectionViewContentSize.height
        print(height)
        collectionViewHeightConstraint.constant = height
    }
    
}

extension AttachedFilesTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].listItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaCollectionViewCell", for: indexPath) as? MediaCollectionViewCell else { return UICollectionViewCell() }
        cell.loadData(item: dataSource[indexPath.section].listItem[indexPath.item])
        return cell
    }
 
}

extension AttachedFilesTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView

            reusableview.frame = CGRect(x: 0 , y: 0, width: 200, height: 0)
             //do other header related calls or settups
            return reusableview


        default:  fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
