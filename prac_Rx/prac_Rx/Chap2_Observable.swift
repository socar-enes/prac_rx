//
//  Chap2_Observable.swift
//  prac_Rx
//
//  Created by enes on 2021/08/18.
//

import RxSwift
import RxCocoa

// MARK: - 2장
extension ViewController {
   
    func chaper2() {
//        let one = 1
//        let two = 2
//        let three = 3
//        let observable = Observable.of(one, two, three)
        
        //        example(of: "just, of, from") {
        //            // 1
//                    let one = 1
        //            let two = 2
        //            let three = 3
        //            // 2
//                    let observable = Observable<Int>.just(one)
//                    let observable2 = Observable.of(one, two, three)
//                    let observable3 = Observable.of([one, two, three])
//                    let observable4 = Observable.from([one, two, three])
        //        }
//
        //        example(of: "subscribe") {
        //
        //            observable.subscribe { event in
        //                print(event)
        //                print(event.element)
        //            }
        //
        //            observable.subscribe(
        //            // 1
        //              onNext: { element in
        //                print(element)
        //            },
        //            // 2
        //              onCompleted: {
        //                print("Completed")
        //              }
        //            )
        //        }
//
        //        example(of: "range") {
        //          // 1부터 증가해서 10개의 옵저버블 생성
        //          let observable = Observable<Int>.range(start: 1, count: 20)
        //          observable.subscribe(onNext: { i in
        //              let n = Double(i)
        //              let fibonacci = Int(
        //                ((pow(1.61803, n) - pow(0.61803, n)) / 2.23606).rounded()
        //              )
        //              print(fibonacci)
        //          })
        //        }
//
        //        example(of: "dispose") {
        //          // 1
        //          let observable = Observable.of("A", "B", "C")
        //        // 2
        //          let subscription = observable.subscribe { event in
        //            // 3
        //            print(event)
        //          }
        //        }
        //
        //        example(of: "DisposeBag") {
        //            // 1
        //            let disposeBag = DisposeBag()
        //            // 2
        //            Observable.of("A", "B", "C")
        //                .subscribe { // 3
        //                    print($0) }
        //                .disposed(by: disposeBag) // 4
        //        }
//
//
//                enum MyError: Error {
//                    case why
//                }
//
//                example(of: "create") {
//                    let disposeBag = DisposeBag()
//                    let observable = Observable<String>.create { observer in
//                        observer.onNext("1")
//                        observer.onCompleted()
//                        observer.onNext("?")
//                        observer.onError(MyError.why)
//                        return Disposables.create()
//                    }
//
//                    observable
//                        .subscribe(onNext: {
//                            print($0)
//                        }).disposed(by: disposeBag)
//                }
    
//
//        example(of: "deferred") {
//            let disposeBag = DisposeBag()
//            // 1
//            var flip = false
//            // 2
//            let factory: Observable<Int> = Observable.deferred {
//                // 3
//                flip.toggle()
//                // 4
//                if flip {
//                    return Observable.of(1, 2, 3)
//                } else {
//                    return Observable.of(4, 5, 6)
//                }
//            }
//            for _ in 0...3 {
//                factory.subscribe(onNext: {
//                    print($0, terminator: "")
//                })
//                .disposed(by: disposeBag)
//                print()
//            }
//        }
        
//        example(of: "never") {
//          let observable = Observable<Any>.never()
//          let disposeBag = DisposeBag()
//
//          observable
//            .debug("observable")
//            .subscribe(
//              onNext: { element in
//                print(element)
//              },
//              onCompleted: {
//                print("Completed")
//              },
//              onDisposed: {
//                print("Disposed")
//              }
//            )
//            .disposed(by: disposeBag)
//        }
//
//        example(of: "never") {
//          let observable = Observable<Any>.never()
//          let disposeBag = DisposeBag()
//
//          observable
//            .do(onSubscribe: {
//              print("Subscribed")
//            })
//            .subscribe(
//              onNext: { element in
//                print(element)
//              },
//              onCompleted: {
//                print("Completed")
//              },
//              onDisposed: {
//                print("Disposed")
//              }
//            )
//            .disposed(by: disposeBag)
//        }
//
//        example(of: "range") {
//          // 1
//          let observable = Observable<Int>.range(start: 1, count: 10)
//          observable
//            .subscribe(onNext: { i in
//        // 2
//                print(i)
//              let n = Double(i)
//              let fibonacci = Int(
//                ((pow(1.61803, n) - pow(0.61803, n)) /
//                  2.23606).rounded()
//              )
//              print(fibonacci)
//          })
//        }
        
//        example(of: "Single") {
//            enum MyError: Error {
//                case what
//            }
//            
//            func loadSomething() -> Single<String> {
//                let disposable = Disposables.create()
//                
//                return Single.create { single in
//                    let some: String? = String("하이하이")
//                    
//                    guard let some = some else {
//                        single(.failure(MyError.what))
//                        return disposable
//                    }
//                    single(.success(some))
//                    return disposable
//                }
//            }
//        }
    }
}
