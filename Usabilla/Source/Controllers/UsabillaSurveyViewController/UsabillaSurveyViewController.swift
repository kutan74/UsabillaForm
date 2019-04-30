//
//  UsabillaSurveyViewController.swift
//  Usabilla
//
//  Created by KUTAN ÇINGISIZ on 30.04.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

open class UsabillaSurveyViewController: UIViewController {
    private let form: UsabillaForm!
    private var tableView: UITableView!
    private var dataSource: UsabillaSurveyViewControllerDataSource!
    
    init(form: UsabillaForm) {
        self.form = form
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutTableView()
        registerTableViewCell()
    }
}

extension UsabillaSurveyViewController {
    fileprivate func layoutTableView() {
        tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 100
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }
    
    fileprivate func registerTableViewCell() {
        guard let survey = form.survey else {
            return
        }
        
        dataSource = UsabillaSurveyViewControllerDataSource(surveyQuestions: survey.surveyQuestions)

        tableView.register(UsabillaSurveyTableViewCell.self, forCellReuseIdentifier: "surveyCell")
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}
