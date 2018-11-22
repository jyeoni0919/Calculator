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
    
    enum Operator: String, CaseIterable {
        case add = "+"
        case subtraction = "-"
        case multiply = "*"
        case division = "/"
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
        //selectedOperator = operators[indexPath.row]
        switch indexPath.row {
        case 0:
            selectedOperator = Operator.add.rawValue
        case 1:
            selectedOperator = Operator.subtraction.rawValue
        case 2:
            selectedOperator = Operator.multiply.rawValue
        case 3:
            selectedOperator = Operator.division.rawValue
        default:
            print("잘못된 접근")
        }
        
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
        
        //cell.textLabel?.text = operators[indexPath.row]
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = Operator.add.rawValue
        case 1:
            cell.textLabel?.text = Operator.subtraction.rawValue
        case 2:
            cell.textLabel?.text = Operator.multiply.rawValue
        case 3:
            cell.textLabel?.text = Operator.division.rawValue
        default:
            cell.textLabel?.text = ""
        }
        return cell
    }
}
