//
//  ViewController.swift
//  MVC_App
//
//  Created by Rajan Arora on 20/06/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        fetchData()
        
        // Table View setup
        tableView.estimatedRowHeight = 250.0
        tableView.rowHeight = UITableView.automaticDimension
        
        // hide the extra rows
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    
    func registerCells() {
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    func fetchData() {
        WebServiceHelper().fetchData(keyword: "Business") { (result) in
            switch result {
            case .success(let news):
                self.articles = news.articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func openWebsite(url : String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK: TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let article = articles[indexPath.row]
        cell.lblTitle.text = article.title
        cell.txtViewDescription.text = article.articleDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        openWebsite(url: article.url)
    }
    

}

