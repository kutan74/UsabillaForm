//
//  UsabillaSurveyViewControllerDataSource.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 30.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

open class UsabillaSurveyViewControllerDataSource: NSObject {
    var surveyQuestions: [String]!
    var selection: [Int: Int] = [:]
    
    weak var delegate: UsabillaSurveyDataSourceDelegate?
    
    init(surveyQuestions: [String]) {
        self.surveyQuestions = surveyQuestions
    }
}

extension UsabillaSurveyViewControllerDataSource: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surveyQuestions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "surveyCell", for: indexPath) as! UsabillaSurveyTableViewCell
        cell.titleLabel.text = surveyQuestions[indexPath.row]
        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        return cell
    }
}

extension UsabillaSurveyViewControllerDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ratingCell", for: indexPath) as! UsabillaSurveyRatingCollectionViewCell
        
        // I think it's a bad way to select / deselect cells
        // Couldn't come up with a better solution
        if selection[collectionView.tag] == indexPath.row {
            cell.checkBoxView.backgroundColor = .black
        } else {
            cell.checkBoxView.backgroundColor = .white
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = collectionView.tag
        let column = indexPath.row
        selection[row] = column
        collectionView.reloadData()
        delegate?.onQuestionRated(for: surveyQuestions[row], with: column)
    }
}
