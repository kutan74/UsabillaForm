//
//  UsabillaSurveyViewControllerDataSource.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 30.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

/** Class to represents UsabillaSurveyViewController's tableview datasource & delegate
 UsabilaSurveyViewController contains a TableView whose cells also contains a CollectionView
*/
open class UsabillaSurveyViewControllerDataSource: NSObject {
    var form: UsabillaForm!
    var selection: [Int: Int] = [:]
    
    weak var delegate: UsabillaSurveyDataSourceDelegate?
    
    init(form: UsabillaForm) {
        self.form = form
    }
}

// MARK: TableView datasource & delegate

extension UsabillaSurveyViewControllerDataSource: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let surveyQuestions = form.survey?.surveyQuestions else {
            return 0
        }
        return surveyQuestions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "surveyCell", for: indexPath) as! UsabillaSurveyTableViewCell
        if let surveyQuestions = form.survey?.surveyQuestions {
            cell.titleLabel.text = surveyQuestions[indexPath.row]
            
            /// Setting datasource
            cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        }        
        return cell
    }
}

// MARK: CollectionView datasource & delegate

extension UsabillaSurveyViewControllerDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ratingCell", for: indexPath) as! UsabillaSurveyRatingCollectionViewCell
        cell.applySurveyCustomProperties(accentColor: form.customProperties!.surveyAccentColor)
        
        // I think it's a bad way to select / deselect cells
        // Couldn't come up with a better solution
        if selection[collectionView.tag] == indexPath.row {
            cell.checkBoxView.backgroundColor = form.customProperties?.surveyAccentColor
        } else {
            cell.checkBoxView.backgroundColor = .white
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// Question
        let row = collectionView.tag
        /// Rating
        let column = indexPath.row

        selection[row] = column
        collectionView.reloadData()
        delegate?.onQuestionRated(for: form.survey!.surveyQuestions[row], with: column)
    }
}
