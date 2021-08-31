//
//  ViewController.swift
//  prac_Rx
//
//  Created by enes on 2021/08/16.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
//    lazy var button = UIButton(frame: CGRect(x: 40, y: 100, width: 200, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
//        button.setTitle("hihihihi", for: .normal)
//        button.backgroundColor = .red
//        view.addSubview(button)
//        bind()

//        chaper2()
//        chaper3()
//        chap5()
//        chap7()
    }
    
    func example(of description: String,
                 action: () -> Void) {
        print("\n--- Example of:", description, "---")
        action()
    }
}


//private extension ViewController {
//    func request() -> Single<Sample> {
//        return .just(Sample(a: 1))
//    }
//
//    func bind() {
//        button.rx.tap
//            .flatMap { _ -> Single<Sample> in
//                return self.request()
//            }
//            .log()
//            .debug()
//            .subscribe(onNext: {
//                print("sub: \($0)")
//            })
//            .disposed(by: disposeBag)
//    }
//}

extension ObservableType {
    func log<T>(_ object: @autoclosure () -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) -> Observable<Element> {
        #if DEBUG
        let value = object()
        let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
        let queue = Thread.isMainThread ? "MAIN" : "BG"
        print("🚙 <\(queue)> \(fileURL) \(function)[\(line)]: " + String(describing: value))
        
        #endif
        return self.asObservable()
    }
    
    func log() -> Observable<Element> {
        print("hihi")
        
        
        
        return self.asObservable()
    }
}


struct Sample {
    let a: Int
}

/*
 버튼클릭시 flatmap으로 전달해보기 통신시

 rx로그로 확장해보기

 리액트킷이 state를 한번에관리하기때문에 하나의 속성이라도 변경시 전체 스트림이 계속내려옴 주의
 */
