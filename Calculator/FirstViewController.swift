//
//  ViewController.swift
//  Calculator
//
//  Created by 공지원 on 20/11/2018.
//  Copyright © 2018 공지원. All rights reserved.
// First Scene

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    //MARK: properties
    let operators = ["+", "-", "*", "/"] //사칙 연산자
    let cellIdentifier = "cell"
    var selectedOperator = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: UITableViewDelegate
    //row가 select되었을 때 호출되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedOperator = operators[indexPath.row]
        
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else {
            return
        }
        
        //데이터 전달
        svc.navigationItem.title = selectedOperator

        self.navigationController?.pushViewController(svc, animated: true)
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operators.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = operators[indexPath.row]
        
        return cell
    }
}

