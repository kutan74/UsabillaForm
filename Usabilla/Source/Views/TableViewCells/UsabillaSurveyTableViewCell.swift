//
//  UsabillaSurveyCollectionViewCell.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 30.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class UsabillaSurveyTableViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Question"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    var collectionView: UICollectionView!
    // CollectionView Flow Layout.
    // Item width and height = Screen.width - (left + right spacing of parent view) - (spacing between items, x9) / itemCount
    var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 25, height: 25)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UsabillaSurveyTableViewCell {
    func layoutViews() {
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(UsabillaSurveyRatingCollectionViewCell.self, forCellWithReuseIdentifier: "ratingCell")
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.allowsMultipleSelection = false
        
        [titleLabel, collectionView].forEach {
            addSubview($0!)
            $0!.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            collectionView.heightAnchor.constraint(equalToConstant: 25)
            ])
    }
    
}

extension UsabillaSurveyTableViewCell {
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.setContentOffset(collectionView.contentOffset, animated:false)
        collectionView.tag = row
        collectionView.reloadData()
    }
}
