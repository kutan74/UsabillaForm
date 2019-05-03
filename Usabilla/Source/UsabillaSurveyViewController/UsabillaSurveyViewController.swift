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
    open var delegate: UsabillaSurveyResultDelegate?

    private var tableView: UITableView!
    private var dataSource: UsabillaSurveyViewControllerDataSource!
    
    private let submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.accessibilityIdentifier = "submit"
        return button
    }()
    
    // Questions - Ratings
    private var surveyResult: [String: Int] = [:]
    
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
        layoutViews()
        registerTableViewCell()
        view.accessibilityIdentifier = "surveyViewController"
    }
}

// MARK: Layout

extension UsabillaSurveyViewController {
    /// I'd normally create a file called UsabillaSurveyView and layout tableview at there
    /// It looks messy I know :)
    fileprivate func layoutViews() {
        tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 100
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.accessibilityIdentifier = "surveyTableView"
        
        [submitButton, tableView].forEach {
            view.addSubview($0!)
            $0!.translatesAutoresizingMaskIntoConstraints = false
        }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            submitButton.heightAnchor.constraint(equalToConstant: 45),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -12),
            ])
        
        submitButton.addTarget(self, action: #selector(onSubmitButtonTapped), for: .touchUpInside)
    }
    
    fileprivate func registerTableViewCell() {
        dataSource = UsabillaSurveyViewControllerDataSource(form: form)
        dataSource.delegate = self

        tableView.register(UsabillaSurveyTableViewCell.self, forCellReuseIdentifier: "surveyCell")
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}

// MARK: Extension to receive question ratings from UsabillaSurveyDataSource

extension UsabillaSurveyViewController: UsabillaSurveyDataSourceDelegate {
    public func onQuestionRated(for question: String, with rating: Int) {
        surveyResult[question] = rating
    }
}

// MARK: Tap actions

extension UsabillaSurveyViewController {
    @objc func onSubmitButtonTapped() {
        delegate?.onSubmitSurveyButtonTapped(result: surveyResult)
    }
}
