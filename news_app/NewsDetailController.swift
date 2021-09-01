//
//  NewsDetailController.swift
//  news_app
//
//  Created by Jiha kim on 2021/09/02.
//

import UIKit

class NewsDetailController : UIViewController{
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    var ImageUrl: String?
    var desc : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = ImageUrl {
            if let data = try? Data(contentsOf: URL(string: img)!){
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
        }
        
        if let d = desc {
            self.LabelMain.text = d
        }
    }
}
