//
//  ViewController.swift
//  news_app
//
//  Created by Jiha kim on 2021/08/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableviewmain: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell.init(style: .default,  reuseIdentifier:
//            "TableCellType1")
        let cell = tableviewmain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
         
        cell.LabelText.text = "\(indexPath.row)"
//        as? as! 부모 자식 친자확인
        
        
//        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableviewmain.delegate = self
        tableviewmain.dataSource = self
    }

//        tableview 테이블뷰 - 여러개의 행이 모여있는 목록 뷰(화면)
//        1.데이터 무엇
//        2.데이터 몇개
//        3.데이터 행 눌렀다
}

