//
//  ViewController.swift
//  PictureShare
//
//  Created by Alexandr on 31.07.2023.
//

import UIKit

// MARK: UIViewController

final class ImagesListViewController: UIViewController {
    
    /// Makes the content of the status bar light
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private let ShowSingleImageSegueIdentifier = "ShowSingleImage"
    
    @IBOutlet private var tableView: UITableView!
    
    private let photosName: [String] = Array(0..<20).map {"\($0)"}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(
            top: 12,
            left: 0,
            bottom: 12,
            right: 0
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == ShowSingleImageSegueIdentifier {
                let viewController = segue.destination as! SingleImageViewController
                let indexPath = sender as! IndexPath
                let image = UIImage(named: photosName[indexPath.row])
                viewController.image = image
            } else {
                super.prepare(for: segue, sender: sender)
            }
        }
    
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
}

// MARK: Configuring cell

extension ImagesListViewController {
    /// Configures the cell
    private func configCell(for cell: ImagesListCell, index: IndexPath) {
        
        guard let image = UIImage(named: photosName[index.row]) else {
            return
        }
        cell.cellImage.image = image
        
        let date = dateFormatter.string(from: Date())
        cell.dateLabel.text = date
        
        let isLike = index.row % 2 == 0
        let likeImage = isLike ? UIImage(named: "likeActive") : UIImage(named: "likeNoActive")
        cell.likeButton.setImage(likeImage, for: .normal)
        
        cell.layer.cornerRadius = 17
        cell.layer.masksToBounds = true
    }
}

// MARK: Data Source

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ImagesListCell.reuseIdentifier,
            for: indexPath
        )
                
        guard let imageListCell = cell as? ImagesListCell else {
            print("Error creating imageListCell")
            return UITableViewCell()
        }
        
        configCell(for: imageListCell, index: indexPath)
        
        return imageListCell
    }
    
}

// MARK: Delegate

extension ImagesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: ShowSingleImageSegueIdentifier, sender: indexPath)
    }
    
    /// Configures the cell according to the image height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return 0
        }
        
        let imageInsets = UIEdgeInsets(
            top: 4,
            left: 16,
            bottom: 4,
            right: 16
        )
        
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        
        return cellHeight
    }
    
}


