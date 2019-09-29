import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import RxSwift

example("Variables") {
    let disposablebag = DisposeBag()
    
    let variable = Variable("A")
    
    variable.asObservable().subscribe(onNext: {
     print($0)
        }).disposed(by: disposablebag)
    
    variable.value = "B"
}

/*
example("ReplaySubject") {
    let disposablebag = DisposeBag()
    
//    let subject = ReplaySubject<String>.create(bufferSize: 1)
//
//    subject.subscribe {
//        print("First subscription: ", $0)
//    }.disposed(by: disposablebag)
//
//    subject.onNext("a")
//    subject.onNext("b")
//
//    subject.subscribe {
//        print("Second subscription: ", $0)
//    }.disposed(by: disposablebag)
//
//    subject.onNext("c")
//    subject.onNext("d")
    
    let subject = ReplaySubject<Int>.create(bufferSize: 3)
    
    subject.onNext(1)
    subject.onNext(2)
    subject.onNext(3)
    subject.onNext(4)
    
    subject.subscribe {
        print($0)
    }.disposed(by: disposablebag)
}


example("BehaviourSubject") {
    let disposablebag = DisposeBag()
    let subject = BehaviorSubject(value: 1) // [1]
    
    let firstSubscription = subject.subscribe(onNext: {
        print(#line, $0)
    }).disposed(by: disposablebag)
    
    subject.onNext(2) // [1, 2]
    subject.onNext(3) // [1, 2, 3]
    
    let secondSubscription = subject.map({ $0 + 2 }).subscribe(onNext: {
        print(#line, $0) // [3]
        }).disposed(by: disposablebag)
}

example("PublishSubject") {
    let disposablebag = DisposeBag()
    
    let subject = PublishSubject<String>()
    
    subject.subscribe {
        print("Subscription First: ", $0)
    }.disposed(by: disposablebag)
    
    enum myError: Error {
        case Test
    }
    
    subject.on(.next("Hello"))
//    subject.onCompleted()
//    subject.onError(myError.Test)
    subject.onNext("RxSwift")
    
    subject.subscribe(onNext: {
        print("Subscription Second: ",$0)
        }).disposed(by: disposablebag)
    
    subject.onNext("Hi!")
    subject.onNext("My name is Kostya")
}

example("") {
    let intObservable = Observable.just(30)
    let stringObservable = Observable.just("Hello")
}

example("just") {
    // observable
    let observable = Observable.just("Hello, RxSwift!")

    // observer
    observable.subscribe( { (event: Event<String>) in
        print(event)
    })

}


example("of") {
    let observable = Observable.of(1, 2, 3, 4, 5)
    observable.subscribe({ (event) in
        print(event)
    })
    
    observable.subscribe {
        print($0)
    }
}

example("create") {
    let items = [1, 2, 3, 4, 5]
    Observable.from(items).subscribe(onNext: { (event) in
        print(event)
    }, onError: { (error) in
        print("error")
    }, onCompleted: {
        print("Ok!")
    }) {
        print("Disposed")
    }
}

example("Disposable") {
    let seq = [1, 2, 3]
    Observable.from(seq).subscribe({ (event) in
        print(event)
    })
    Disposables.create()
}

example("dispose") {
    let seq = [1, 2, 3]
    let subscription = Observable.from(seq)
    subscription.subscribe { (event) in
        print(event)
    }.dispose()
}

 
example("disposeBag") {
    let disposeBag = DisposeBag()
    let seq = [1, 2, 3]
    let subscription = Observable.from(seq)
    subscription.subscribe { (event) in
        print(event)
    }.disposed(by: disposeBag)
}

example("takeUntil") {
    let stopSeq = Observable.just(1).delaySubscription(2, scheduler: MainScheduler.instance)
    let seq = Observable.from([1, 2, 3]).takeUntil(stopSeq)
    seq.subscribe {
        print($0)
    }
}

example("filter") {
    let seq = Observable.of(1, 2, 20, 3, 40).filter{ $0 > 10 }
    
    seq.subscribe { (event) in
        print(event)
    }
    
}
 
example("map") {
    let seq = Observable.of(1, 2, 3).map { $0 * 10 }
    seq.subscribe { (event) in
        print(event)
    }
}


example("merge") {
    let firstSeq = Observable.of(1, 2, 3)
//    let secondSeq = Observable.of("A", "B", "C")
    let secondSeq = Observable.of(5, 7, 9)
    
    let bothSeq = Observable.of(firstSeq, secondSeq)
    let mergeSeq = bothSeq.merge()
    
    mergeSeq.subscribe { (event) in
        print(event)
    }
}
*/
