//
//  DetailViewController.swift
//  KwMemo
//
//  Created by KyunWu on 2020/12/17.
//

import UIKit

class DetailViewController: UIViewController {

    var memo: Memo?
    
    let dateFormater: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 //Memo.dummyMemoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
        
            cell.textLabel?.text = memo?.content
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            
            cell.textLabel?.text = dateFormater.string(from: (memo?.created_at)!)
            return cell
    
        default:
            print("\(indexPath.row)")
            fatalError()
        }
    }
    
}
