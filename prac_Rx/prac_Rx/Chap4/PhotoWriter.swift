//
//  PhotoWriter.swift
//  prac_Rx
//
//  Created by enes on 2021/08/24.
//

import UIKit
import RxSwift
import Photos

class PhotoWriter {
    enum Errors: Error {
        case couldNotSavePhoto
    }
    
    static func save(_ image: UIImage) -> Single<String> {
        return Single.create { observer in
            var savedAssetId: String?
            PHPhotoLibrary.shared().performChanges {
                let request = PHAssetChangeRequest.creationRequestForAsset(from: image)
                savedAssetId = request.placeholderForCreatedAsset?.localIdentifier
            } completionHandler: { success, error in
                DispatchQueue.main.async {
                    if success, let id = savedAssetId {
                        observer(.success(id))
                    } else {
                        observer(.failure(error ?? Errors.couldNotSavePhoto))
                    }
                }
            }
            
            return Disposables.create()
        }
    }
}


