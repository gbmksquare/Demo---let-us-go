//
//  ViewController.swift
//  Screenshot
//
//  Created by BumMo Koo on 2017. 3. 31..
//  Copyright © 2017년 BumMo Koo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    @IBOutlet fileprivate weak var indicatorView: UIActivityIndicatorView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate lazy var images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        indicatorView.hidesWhenStopped = true
        getPhotos()
    }
}

extension ViewController {
    func getPhotos() {
        if UserDefaults.standard.bool(forKey: "FASTLANE_SNAPSHOT") {
            getSpecifiedPhotos()
        } else {
            getRandomPhotos()
        }
    }
    
    func getRandomPhotos() {
        indicatorView.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        DispatchQueue.global(qos: .userInteractive).async { [unowned self] in
            let array = [
                "https://source.unsplash.com/category/nature/300x300",
                "https://source.unsplash.com/category/buildings/300x300",
                "https://source.unsplash.com/category/food/300x300",
                "https://source.unsplash.com/category/people/300x300",
                "https://source.unsplash.com/category/objects/300x300",
                "https://source.unsplash.com/category/technology/300x300",
                "https://source.unsplash.com/category/nature/300x300",
                "https://source.unsplash.com/category/buildings/300x300",
                "https://source.unsplash.com/category/food/300x300",
                "https://source.unsplash.com/category/people/300x300",
                "https://source.unsplash.com/category/objects/300x300",
                "https://source.unsplash.com/category/technology/300x300",
                "https://source.unsplash.com/category/nature/300x300",
                "https://source.unsplash.com/category/buildings/300x300",
                "https://source.unsplash.com/category/food/300x300",
                "https://source.unsplash.com/category/people/300x300",
                "https://source.unsplash.com/category/objects/300x300",
                "https://source.unsplash.com/category/technology/300x300",
                "https://source.unsplash.com/category/nature/300x300",
                "https://source.unsplash.com/category/buildings/300x300",
                "https://source.unsplash.com/category/food/300x300",
                "https://source.unsplash.com/category/people/300x300",
                "https://source.unsplash.com/category/objects/300x300",
                "https://source.unsplash.com/category/technology/300x300",
                "https://source.unsplash.com/category/nature/300x300",
                "https://source.unsplash.com/category/buildings/300x300",
                "https://source.unsplash.com/category/food/300x300",
                "https://source.unsplash.com/category/people/300x300",
                "https://source.unsplash.com/category/objects/300x300",
                "https://source.unsplash.com/category/technology/300x300"
            ]
            for address in array {
                guard let url = URL(string: address),
                    let data = try? Data(contentsOf: url),
                    let image = UIImage(data: data) else { continue }
                self.images.append(image)
            }
            DispatchQueue.main.async {
                self.indicatorView.stopAnimating()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.collectionView.reloadData()
            }
        }
    }
    
    func getSpecifiedPhotos() {
        indicatorView.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        DispatchQueue.global(qos: .userInteractive).async { [unowned self] in
            let array = [
                "https://source.unsplash.com/weekly?water",
                "https://source.unsplash.com/weekly?fire",
                "https://source.unsplash.com/weekly?earth",
                "https://source.unsplash.com/weekly?mountain",
                "https://source.unsplash.com/weekly?ocean",
                "https://source.unsplash.com/weekly?forest",
                "https://source.unsplash.com/weekly?human",
                "https://source.unsplash.com/weekly?animal",
                "https://source.unsplash.com/weekly?plant",
                "https://source.unsplash.com/weekly?korea",
                "https://source.unsplash.com/weekly?europe",
                "https://source.unsplash.com/weekly?antarctica",
                "https://source.unsplash.com/weekly?phone",
                "https://source.unsplash.com/weekly?ipad",
                "https://source.unsplash.com/weekly?macbook",
                "https://source.unsplash.com/weekly?apple",
                "https://source.unsplash.com/weekly?banana",
                "https://source.unsplash.com/weekly?pear",
                ]
            for address in array {
                guard let url = URL(string: address),
                    let data = try? Data(contentsOf: url),
                    let image = UIImage(data: data) else { continue }
                self.images.append(image)
            }
            DispatchQueue.main.async {
                self.indicatorView.stopAnimating()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.collectionView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // Data source
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        if images.count > indexPath.row {
            let image = images[indexPath.row]
            cell.image = image
        }
        return cell
    }
    
    // Flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = collectionView.bounds.size.width / 3
        return CGSize(width: side, height: side)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

