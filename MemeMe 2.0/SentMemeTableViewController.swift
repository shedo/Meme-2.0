//
//  SentMemeTableViewController.swift
//  MemeMe 2.0
//
//  Created by Ivan Zandonà on 06/10/2020.
//

import UIKit

class SentMemeTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
           selector: #selector(SentMemeTableViewController.handleModalDismissed),
           name: NSNotification.Name(rawValue: "modalIsDimissed"),
           object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView!.reloadData()
    }
    
    @objc func handleModalDismissed() {
        self.tableView!.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeRow") as! CustomMemeRow
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textRow?.text = meme.topText + " " + meme.bottomText
        cell.imageRow?.image = meme.memedImage

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
