//
//  ImageCollectionVC.swift
//  ContactApp
//
//  Created by Divya Panthi on 24/08/2022.
//

import UIKit

protocol ProfileImageProtocol: AnyObject{
    
    func passProfile(profileImage : UIImageView)
}


class ImageCollectionVC: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageGallery = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"),  UIImage(named: "7"), UIImage(named: "8"), UIImage(named: "9"), UIImage(named: "10"), UIImage(named: "11"), UIImage(named: "12"), UIImage(named: "13"), UIImage(named: "14"), UIImage(named: "15"), UIImage(named: "15"), UIImage(named: "15"), UIImage(named: "15"), UIImage(named: "15")]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "CellImageCollection", bundle: nil), forCellWithReuseIdentifier: "CellImageCollection")
        

    }
    

}

extension ImageCollectionVC: UICollectionViewDelegate,  UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "CellImageCollection", for: indexPath) as! CellImageCollection
        
        cell.imgProfile.image = imageGallery[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return  imageGallery.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let cell = collectionView.cellForItem(at: indexPath) as! CellImageCollection
//
//        profile = cell.imgProfile.

        self.navigationController?.popViewController(animated: true)
        
    }
    
        
    
}

