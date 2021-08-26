//
//  Chap3_Subject.swift
//  prac_Rx
//
//  Created by enes on 2021/08/19.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - 3장
extension ViewController {
    func chaper3() {
//        challenges()
//        example(of: "PublishSubject") {
//            let subject = PublishSubject<String>()
//            subject.onNext("Is anyone listening?")
//
//            let subscriptionOne = subject
//                .subscribe(onNext: { string in
//                    print(string)
//                })
//
//            subject.onNext("1")
//            subject.onNext("2")
//
//            let subscriptionTwo = subject
//              .subscribe { event in
//                print("2)", event.element ?? event)
//              }
//
//            subject.onNext("3")
//            subscriptionOne.dispose()
//            subject.onNext("4")
//
//            // 1
//            subject.onCompleted()
//            // 2
//            subject.onNext("5")
//            // 3
//            subscriptionTwo.dispose()
//            let disposeBag = DisposeBag()
//            // 4
//            subject
//              .subscribe {
//                print("3)", $0.element ?? $0)
//              }
//              .disposed(by: disposeBag)
//            subject.onNext("?")
//
//       }
        // 1
        enum MyError: Error {
          case anError
        }
        
        
        // 3
//        example(of: "BehaviorSubject") {
//            // 4
//            let subject = BehaviorSubject(value: "Initial value")
//            let disposeBag = DisposeBag()
//
//            subject
//                .subscribe {
//                    print(label: "1)", event: $0)
//                }
//                .disposed(by: disposeBag)
//
//            subject.onNext("X")
//
//            // 1
//            subject.onError(MyError.anError)
//            // 2
//            subject
//              .subscribe {
//                print(label: "2)", event: $0)
//              }
//              .disposed(by: disposeBag)
//        }
        
//        example(of: "ReplaySubject") {
//            // 1
//            let subject = ReplaySubject<String>.create(bufferSize: 2)
//            let disposeBag = DisposeBag()
//            // 2
//            subject.onNext("1")
//            subject.onNext("2")
//            subject.onNext("3")
//            // 3
//            subject
//                .subscribe {
//                    print(label: "1)", event: $0)
//                }
//                .disposed(by: disposeBag)
//            subject
//                .subscribe {
//                    print(label: "2)", event: $0)
//                }
//                .disposed(by: disposeBag)

//            subject.onNext("4")
//            subject
//              .subscribe {
//                print(label: "3)", event: $0)
//              }
//              .disposed(by: disposeBag)
//
//            subject.dispose()
//        }
        
//        example(of: "PublishRelay") {
//            let relay = PublishRelay<String>()
//            let disposeBag = DisposeBag()
//            relay.accept("Knock knock, anyone home?")
//            relay
//                .subscribe(onNext: {
//                            print($0) })
//                .disposed(by: disposeBag)
//            relay.accept("1")

//        }
//
//        example(of: "BehaviorRelay") {
//            // 1
//            let relay = BehaviorRelay(value: "Initial value")
//            let disposeBag = DisposeBag()
//            // 2
//            relay.accept("New initial value")
//            // 3
//            relay
//                .subscribe {
//                    print(label: "1)", event: $0)
//                }
//                .disposed(by: disposeBag)
//            // 1
//            relay.accept("1")
//            // 2
//            relay
//                .subscribe {
//                    print(label: "2)", event: $0)
//                }
//                .disposed(by: disposeBag)
//            // 3
//            relay.accept("2")
//
//        }
        
    }

//    func challenges() {
//
//        example(of: "BehaviorRelay") {
//            enum UserSession {
//                case loggedIn, loggedOut
//            }
//
//            enum LoginError: Error {
//                case invalidCredentials
//            }
//
//            let disposeBag = DisposeBag()
//
//            // Create userSession BehaviorRelay of type UserSession with initial value of .loggedOut
//            let userSessionRelay = BehaviorRelay<UserSession>(value: .loggedOut)
//            // Subscribe to receive next events from userSession
//            userSessionRelay
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//
//            func logInWith(username: String, password: String, completion: (Error?) -> Void) {
//                guard username == "johnny@appleseed.com",
//                      password == "appleseed" else {
//                    completion(LoginError.invalidCredentials)
//                    return
//                }
//
//                // Update userSession
//                userSessionRelay.accept(.loggedIn)
//            }
//
//            func logOut() {
//                // Update userSession
//                userSessionRelay.accept(.loggedOut)
//            }
//
//            func performActionRequiringLoggedInUser(_ action: () -> Void) {
//                // Ensure that userSession is loggedIn and then execute action()
//                if userSessionRelay.value == .loggedIn {
//                    action()
//                }
//            }
//
//            for i in 1...2 {
//                let password = i % 2 == 0 ? "appleseed" : "password"
//
//                logInWith(username: "johnny@appleseed.com", password: password) { error in
//                    guard error == nil else {
//                        print(error!)
//                        return
//                    }
//
//                    print("User logged in.")
//                }
//
//                performActionRequiringLoggedInUser {
//                    print("Successfully did something only a logged in user can do.")
//                }
//            }
//        }
//    }

}
// 2
func print<T: CustomStringConvertible>(label: String, event: Event<T>) {
  print(label, (event.element ?? event.error) ?? event)
}

