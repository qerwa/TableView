//
//  ViewController.swift
//  TabieView
//
//  Created by D7703_17 on 2018. 5. 2..
//  Copyright © 2018년 D7703_17. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
      
      var data = ["Dog", "Cat", "Pig", "Cow", "Mouse", "Sheep"]
      var price = ["1000", "1500", "2000", "10000", "10", "500"]
      
      @IBOutlet weak var myTableView: UITableView!
      
      override func viewDidLoad() {
            super.viewDidLoad()
            myTableView.dataSource = self
            myTableView.delegate = self
      }
      
      // UITableViewDataSource Delegate Method call
      public func numberOfSections(in tableView: UITableView) -> Int {
            // Default is 1 if not implemented
            return 2
      }
      
      public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return data.count
      }
      
      // 실제 cell을 만들고 데이터 할당
      public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let identifier = "RE"
            // cell을 하나 메모리 할당함. 다음에는 재활용 됨
            let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            //cell.textLabel?.text = "동물원"
            cell.textLabel?.text = data[indexPath.row]
            cell.detailTextLabel?.text = price[indexPath.row]
            
            // cell에 image 넣기
            cell.imageView?.image = UIImage(named: "1.jpg")
            return cell
      }
      
      func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            // fixed font style. use custom view (UILabel) if you want something different
            
            if section == 0 {
                  return "1st section"
            } else {
                  return "2nd section"
            }
      }
      
//      public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//
//            if section == 0 {
//                  return "section footer " + String(section)
//            } else {
//                  return "section footer " + String(section)
//            }
//      }
//
      //row의 height 조절
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100.0
      }
      // UITableViewDelegate Method
      public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let mySection = indexPath.section
            let myRow = indexPath.row
            print("I selected \(mySection) Section \(myRow) Row")
            let output = String(mySection) + " Section" + String(myRow) + " Row" + " Seclected"
            
            // Closure
            let alert = UIAlertController(title: "AlertController", message: "Test", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: output, style: .default) { action in
                  // perhaps use action.title here
                  print("Default")
                  
            })
            
            alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (action) -> Void in
                  print("취소 했습니다.")
            }))
            
            
            alert.addAction(UIAlertAction(title: "확인", style: .default) { action in
                  print("확인하세요")
            })
            
            alert.addAction(UIAlertAction(title: "DELETE", style: .destructive, handler: { (action) -> Void in
                  self.view.backgroundColor = UIColor.red
                  print("삭제 했습니다.")
            }))
            
            self.present(alert, animated: true, completion: nil)
      }
}
