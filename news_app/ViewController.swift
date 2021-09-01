//
//  ViewController.swift
//  news_app
//
//  Created by Jiha kim on 2021/08/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableviewmain: UITableView!
    
    var newsData : Array<Dictionary<String, Any>>?
    
    func getNews() {
        let task = URLSession.shared.dataTask(with: URL(string:
            "https://newsapi.org/v2/top-headlines?country=kr&apiKey=0c036df76e384e328dac2f2b4f15cc78")!) { (data, response, error) in
            
            if let dataJson = data{
                print(dataJson)
//                json parsing
                do{
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    print(json)
//                    Dictionary
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    print(articles)
                    self.newsData = articles
                    DispatchQueue.main.async {
                        self.tableviewmain.reloadData()

                    }
//                    for (idx, value) in articles.enumerated() {
//                        if let v = value as? Dictionary<String, Any>{
//                           print("\(v["title"])")
//                        }
//                    }
                }
                catch{}
            }
            
        }
        task.resume()
    }
//    셀을 반복할 횟수
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let news = newsData {
            return news.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell.init(style: .default,  reuseIdentifier:
//            "TableCellType1")
        let cell = tableviewmain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
         
        let idx = indexPath.row
        print("idx ::\(idx)")
        if let news = newsData {
            
            let row = news[idx]
            print("row :: \(row)")
            if let r = row as? Dictionary<String, Any>{
                print("TITLE :: \(r)")
                if let title = r["title"] as? String{
                cell.LabelText.text = title
                }
                }
        }
//        as? as! 부모 자식 친자확인
        
        
//        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableviewmain.delegate = self
        tableviewmain.dataSource = self
        
        getNews()
    }

//        tableview 테이블뷰 - 여러개의 행이 모여있는 목록 뷰(화면)
//        1.데이터 무엇
//        2.데이터 몇개
//        3.데이터 행 눌렀다
}

