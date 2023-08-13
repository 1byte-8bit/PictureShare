//
//  ViewController.swift
//  PictureShare
//
//  Created by Alexandr on 31.07.2023.
//

import UIKit

class ImagesListViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    // Делает содержимое статус бара светлым
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register the ImagesListCell using a code
        // tableView.register(ImagesListCell.self, forCellReuseIdentifier: ImagesListCell.reuseIdentifier)
    }
    
    func configCell(for cell: ImagesListCell) {
        cell.layer.cornerRadius = 16
        cell.layer.masksToBounds = true
    }

}

// MARK: Data Source
extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath) // 1
                
        guard let imageListCell = cell as? ImagesListCell else {
            print("Error creating imageListCell")
            return UITableViewCell()
        }
        
        configCell(for: imageListCell)
        return imageListCell
    }
    
}

// MARK: Delegate
extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

