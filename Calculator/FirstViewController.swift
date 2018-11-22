//
//  ViewController.swift
//  Calculator
//
//  Created by 공지원 on 20/11/2018.
//  Copyright © 2018 공지원. All rights reserved.
// First Scene

import UIKit

class FirstViewController: UIViewController {
    //MARK: Properties
    //private let operators = ["+", "-", "*", "/"] //사칙 연산자
    private let cellIdentifier = "operatorCell"
    
    enum Operator: Int, CaseIterable {
        case add = 0
        case subtraction = 1
        case multiply = 2
        case division = 3
        
        func getOperator() -> String {
            switch self {
            case .add:
                return "+"
            case .subtraction:
                return "-"
            case .multiply:
                return "*"
            case .division:
                return "/"
            }
        }
    }

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: UITableViewDelegate
extension FirstViewController: UITableViewDelegate {
    //row가 select되었을 때 호출되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedOperator = ""
        
        guard let operation = Operator.init(rawValue: indexPath.row) else { return }
        selectedOperator = operation.getOperator()
        
        guard let svc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        //데이터 전달
        svc.navigationItem.title = selectedOperator
        
        navigationController?.pushViewController(svc, animated: true)
    }
}

//MARK: UITableViewDataSource
extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return operators.count
        return Operator.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        guard let operation = Operator.init(rawValue: indexPath.row) else { return UITableViewCell() }
        cell.textLabel?.text = operation.getOperator()
        
        return cell
    }
}
