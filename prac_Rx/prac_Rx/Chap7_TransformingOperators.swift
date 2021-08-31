//
//  Chap7_TransformingOperators.swift
//  prac_Rx
//
//  Created by enes on 2021/08/30.
//

import Foundation
import RxSwift
import RxCocoa

extension ViewController {
    func chap7() {
//        example(of: "toArray") {
//            let disposeBag = DisposeBag()
//            // 1
//            Observable.of("A", "B", "C")
//                // 2
//                .toArray()
//                .subscribe(onSuccess: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//        }
        
//        example(of: "map") {
//            let disposeBag = DisposeBag()
//            let formatter = NumberFormatter()
//            formatter.numberStyle = .spellOut
//            Observable<Int>.of(123, 4, 56)
//                // 3
//                .map { formatter.string(for: $0) ?? "" }
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//        }
        
        //        example(of: "enumerated and map") {
        //            let disposeBag = DisposeBag()
        //            Observable.of(1, 2, 3, 4, 5, 6)
        //                .enumerated()
        //                .map { index, integer in
        //                    index > 2 ? integer * 2 : integer
        //                }
        //                .subscribe(onNext: {
        //                    print($0)
        //                })
        //                .disposed(by: disposeBag)
        //        }
        
//        example(of: "compactMap") {
//            let disposeBag = DisposeBag()
//            Observable.of("To", "be", nil, "or", "not", "to", "be", nil)
//                .compactMap { $0 }
//                .toArray()
//                .map { $0.joined(separator: " ") }
//                .subscribe(onSuccess: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//        }
        
        
        struct Student {
            let score: BehaviorSubject<Int>
        }
        
//        example(of: "flatMap") {
//            let disposeBag = DisposeBag()
//            let laura = Student(score: BehaviorSubject(value: 80))
//            let charlotte = Student(score: BehaviorSubject(value: 90))
//            let student = PublishSubject<Student>()
//            student
//                .flatMap {
//                    $0.score
//                }
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//
//            student.onNext(laura)
//            laura.score.onNext(85)
//            student.onNext(charlotte)
//            laura.score.onNext(95)
//            charlotte.score.onNext(100)
//        }
    
//        example(of: "materialize") {
        
//        example(of: " dematerialize") {
//            enum MyError: Error {
//                case anError
//            }
//            let disposeBag = DisposeBag()
//            let laura = Student(score: BehaviorSubject(value: 80))
//            let charlotte = Student(score: BehaviorSubject(value: 100))
//            let student = BehaviorSubject(value: laura)
//            let studentScore = student
//                .flatMapLatest {
//                    $0.score.materialize()
//                }
//            studentScore
//                .dematerialize()
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//            laura.score.onNext(85)
//            laura.score.onError(MyError.anError)
//            laura.score.onNext(90)
//            student.onNext(charlotte)
//        }
    }
}
