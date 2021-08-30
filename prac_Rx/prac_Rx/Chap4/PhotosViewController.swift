//
//  PhotosViewController.swift
//  prac_Rx
//
//  Created by enes on 2021/08/24.
//

import UIKit
import Photos
import RxSwift
import RxCocoa

extension PHPhotoLibrary {
    static var authorized: Observable<Bool> {
        return Observable.create { observer in
            DispatchQueue.main.async {
                if authorizationStatus() == .authorized {
                    observer.onNext(true)
                    observer.onCompleted()
                } else {
                    observer.onNext(false)
                    requestAuthorization { newStatus in
                        observer.onNext(newStatus == .authorized)
                        observer.onCompleted()
                    }
                } }
            return Disposables.create()
        }
    } }

class PhotosViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: private properties
    private lazy var photos = PhotosViewController.loadPhotos()
    private lazy var imageManager = PHCachingImageManager()
    
    static func loadPhotos() -> PHFetchResult<PHAsset> {
        let allPhotosOptions = PHFetchOptions()
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        return PHAsset.fetchAssets(with: allPhotosOptions)
    }
    private lazy var thumbnailSize: CGSize = {
        let cellSize = (self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize
        return CGSize(width: cellSize.width * UIScreen.main.scale,
                      height: cellSize.height * UIScreen.main.scale)
    }()
    private let selectedPhotosSubject = PublishSubject<UIImage>()
    var selectedPhotos: Observable<UIImage> {
      return selectedPhotosSubject.asObservable()
    }
    private let disposeBag = DisposeBag()
    let authorized = PHPhotoLibrary.authorized.share()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        authorized
            .skip { !$0 }
            .take(1)
            .subscribe(onNext: { [weak self] _ in
                self?.photos = PhotosViewController.loadPhotos()
                DispatchQueue.main.async {
                    self?.collectionView?.reloadData()
                }
            })
            .disposed(by: disposeBag)
       
        authorized
            .distinctUntilChanged()
            .takeLast(1)
            .filter { !$0 }
            .subscribe(onNext: { [weak self] _ in
                guard let errorMessage = self?.errorMessage else { return }
                DispatchQueue.main.async(execute: errorMessage)
            })
            .disposed(by: disposeBag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        selectedPhotosSubject.onCompleted()
    }
    
    deinit {
        print("✅deinit")
    }
    
    private func errorMessage() {
      alert(title: "No access to Camera Roll",
        text: "You can grant access to Combinestagram from the Settings app")
        .asObservable()
        .take(for: .seconds(5), scheduler: MainScheduler.instance)
        .subscribe(onCompleted: { [weak self] in
            self?.dismiss(animated: true, completion: nil)
            self?.navigationController?.popViewController(animated: true)
        })
        .disposed(by: disposeBag)
    }
    
}


// MARK: - UICollectionView DataSource
extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let asset = photos.object(at: indexPath.item)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.representedAssetIdentifier = asset.localIdentifier
        imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
            if cell.representedAssetIdentifier == asset.localIdentifier {
                cell.imageView.image = image
            }
        })
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let asset = photos.object(at: indexPath.item)
        print("select")
        if let cell = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell {
            cell.flash()
        }
        
        imageManager.requestImage(for: asset, targetSize: view.frame.size, contentMode: .aspectFill, options: nil, resultHandler: { [weak self] image, info in
            guard let image = image, let info = info else { return }
            if let isThumbnail = info[PHImageResultIsDegradedKey as NSString] as? Bool, !isThumbnail {
                self?.selectedPhotosSubject.onNext(image)
            }
        })
    }
}

