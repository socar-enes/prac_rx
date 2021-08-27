//
//  Chap5.swift
//  prac_Rx
//
//  Created by enes on 2021/08/26.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - 5장
extension ViewController {
    func chap5() {
//        example(of: "ignoreElements") {
//            // 1
//            let strikes = PublishSubject<String>()
//            let disposeBag = DisposeBag()
//            // 2
//            strikes
//                .ignoreElements()
//                .subscribe { _ in
//                    print("You're out!")
//                }
//                .disposed(by: disposeBag)
//            strikes.onNext("X")
//            strikes.onNext("X")
//            strikes.onNext("X")
//            strikes.onCompleted()
//        }
        
//        example(of: "elementAt") {
//            // 1
//            let strikes = PublishSubject<String>()
//            let disposeBag = DisposeBag()
//            // 2
//            strikes
//                .element(at: 2)
//                .subscribe {
//                    switch $0 {
//                    case let .next(text):
//                        print(text)
//                    default:
//                        print("You're out!")
//                    }
//                }
//                .disposed(by: disposeBag)
//            strikes.onNext("1")
//            strikes.onNext("2")
//            strikes.onNext("3")
//            strikes.onCompleted()
//        }
        
//        example(of: "filter") {
//            let disposeBag = DisposeBag()
//            // 1
//            Observable.of(1, 2, 3, 4, 5, 6)
//                .filter { $0.isMultiple(of: 2) }
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//        }
//
//        example(of: "skip") {
//            let disposeBag = DisposeBag()
//            // 1
//            Observable.of("A", "B", "C", "D", "E", "F")
//                // 2
//                .skip(3)
//                .subscribe(onNext: {
//                            print($0) })
//                .disposed(by: disposeBag)
//        }
        
//        example(of: "skipWhile") {
//            let disposeBag = DisposeBag()
//            Observable.of(2, 2, 3, 4, 4)
//                .skip(while: {
//                    $0.isMultiple(of: 2)
//                })
//                .subscribe(onNext: {
//                            print($0) })
//                .disposed(by: disposeBag)
//        }
//
//        example(of: "skipUntil") {
//            let disposeBag = DisposeBag()
//            let subject = PublishSubject<String>()
//            let trigger = PublishSubject<String>()
//            subject
//                .skip(until: trigger)
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//
//            subject.onNext("A")
//            subject.onNext("B")
//
//            trigger.onNext("start")
//            // 이시점 부터 모든 이벤트를 통과시킴
//            subject.onNext("C")
//            subject.onNext("D")
//        }

//        example(of: "take") {
//            let disposeBag = DisposeBag()
//            Observable.of(1, 2, 3, 4, 5, 6)
//                .take(4)
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//        }
        
//        example(of: "takeWhile") {
//            let disposeBag = DisposeBag()
//            Observable.of(2, 2, 3, 4, 4, 6, 6)
//                .enumerated()
//                .take(while: { index, integer in
//                    integer.isMultiple(of: 2)
//                })
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//        }
        
//        example(of: "takeUntil") {
//            let disposeBag = DisposeBag()
//            // 1
//            Observable.of(1, 2, 3, 4, 5)
//                // 2
//                .take(until: { $0.isMultiple(of: 2) }, behavior: .inclusive)
//                .subscribe(onNext: {
//                    print($0)
//
//                })
//                .disposed(by: disposeBag)
//        }
//
//        example(of: "takeUntil trigger") {
//            let disposeBag = DisposeBag()
//            // 1
//            let subject = PublishSubject<String>()
//            let trigger = PublishSubject<String>()
//            // 2
//            subject
//                .take(until: trigger)
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//            // 3
//            subject.onNext("1")
//            subject.onNext("2")
//
//            trigger.onNext("X")
//            subject.onNext("3")
//        }
//
//        example(of: "distinctUntilChanged") {
//            let disposeBag = DisposeBag()
//            // 1
//            Observable.of("A", "A", "B", "B", "A")
//                // 2
//                .distinctUntilChanged()
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//        }
        
        
//        example(of: "Challenge 1") {
//            let disposeBag = DisposeBag()
//            
//            let contacts = [
//                "603-555-1212": "Florent",
//                "212-555-1212": "Shai",
//                "408-555-1212": "Marin",
//                "617-555-1212": "Scott"
//            ]
//            
//            func phoneNumber(from inputs: [Int]) -> String {
//                var phone = inputs.map(String.init).joined()
//                
//                phone.insert("-", at: phone.index(
//                                phone.startIndex,
//                                offsetBy: 3)
//                )
//                
//                phone.insert("-", at: phone.index(
//                                phone.startIndex,
//                                offsetBy: 7)
//                )
//                
//                return phone
//            }
//            
//            let input = PublishSubject<Int>()
//            
//            // Add your code here
//            // 0으로 시작할 수없음 -> skipWhile
//            // 하나의 숫자만 입력받음 필터로 10보다 작은것만 허용해야함 -> filter
//            // 10개의 번호만 가져옴 -> take, toArray
//            
//            input
//                .skip{ $0 == 0 }
//                .filter { $0 < 10 }
//                .take(10)
//                .toArray()
//                .asObservable()
//                .subscribe(onNext: {
//                    print($0)
//                    let phone = phoneNumber(from: $0)
//                    print(phone)
//                    if let contact = contacts[phone] {
//                      print("Dialing \(contact) (\(phone))...")
//                    } else {
//                      print("Contact not found")
//                    }
//                })
//                .disposed(by: disposeBag)
//            
//            input.onNext(0)
//            input.onNext(603)
//            
//            input.onNext(2)
//            input.onNext(1)
//            
//            // Confirm that 7 results in "Contact not found",
//            // and then change to 2 and confirm that Shai is found
//            /// 실패값
////            input.onNext(7)
//            /// 성공값
//            input.onNext(2)
//            
//            "5551212".forEach {
//                if let number = (Int("\($0)")) {
//                    input.onNext(number)
//                }
//            }
//            
//            input.onNext(9)
//            
//        }
    }
}

