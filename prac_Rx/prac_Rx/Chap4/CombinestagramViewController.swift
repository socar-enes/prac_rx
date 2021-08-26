//
//  CombinestagramViewController.swift
//  prac_Rx
//
//  Created by enes on 2021/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class CombinestagramViewController: UIViewController {
   
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    /// 사진저장
    private let images: BehaviorRelay<[UIImage]> = .init(value: [])
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bind()
    }
    
    func bind() {
        // 이미지 변화시 사진분할작업실행
        images
            .subscribe(onNext: { [weak imageView] in
                guard let imageView = imageView else {
                    return
                }
                imageView.image = $0.collage(size: imageView.frame.size)
            })
            .disposed(by: disposeBag)
        
        images
            .subscribe(onNext: { [weak self] in
                self?.updateUI(photos: $0)
            })
            .disposed(by: disposeBag)
        
        // 사진더하기 버튼
        addButton.rx.tap
            .do(onNext: { [weak self] in
                self?.actionAdd()
            })
            .subscribe()
            .disposed(by: disposeBag)
        
        clearButton.rx.tap
            .do(onNext: { [weak self] in
                self?.actionClear()
            })
            .subscribe()
            .disposed(by: disposeBag)
        
        saveButton.rx.tap
            .do(onNext: { [weak self] in
                self?.actionSave()
            })
            .subscribe()
            .disposed(by: disposeBag)
    }
    
    func actionAdd() {
//        let newImage = images.value + [UIImage(named: "IMG_1907")!]
//        images.accept(newImage)
        nextVC()
    }
    
    func actionClear() {
        images.accept([])
    }
    
    func updateUI(photos: [UIImage]) {
        saveButton.isEnabled = photos.count > 0 && photos.count % 2 == 0
        clearButton.isEnabled = photos.count > 0
        addButton.isEnabled = photos.count < 6
        title = photos.count > 0 ? "\(photos.count) photos" : "Collage"
    }
    
    func nextVC() {
        let photosVC = storyboard?.instantiateViewController(withIdentifier: "PhotosViewController") as! PhotosViewController
        navigationController?.pushViewController(photosVC, animated: true)
        
        photosVC.selectedPhotos
            .subscribe(onNext: { [weak self] image in
                guard let images = self?.images else { return }
                self?.images.accept(images.value + [image])
                print("✅하이하이")
            })
            .disposed(by: disposeBag)
    }
    
    func actionSave() {
        guard let image = imageView.image else { return }
        PhotoWriter.save(image)
            .subscribe(onSuccess: { [weak self] id in
                    self?.showMessage("Save with id: \(id)")
            }, onFailure: { [weak self] error in
                self?.showMessage("Error", description: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
    func showMessage(_ title: String, description: String? = nil) {
      let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { [weak self] _ in self?.dismiss(animated: true, completion: nil)}))
      present(alert, animated: true, completion: nil)
    }
}
