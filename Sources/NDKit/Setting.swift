//
//  Setting.swift
//  NDKit
//
//  Created by Nicolas Degen on 11.04.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import Foundation
import Combine

@propertyWrapper
public struct Setting<T> {
  
  let key: String
  let defaultValue: T
  
  init(wrappedValue value: T, key: String) {
    self.key = key
    self.defaultValue = value
  }
  
  public var wrappedValue: T {
    get {
      let val = UserDefaults.standard.object(forKey: key) as? T
      return val ?? defaultValue
    }
    set {
      objectWillChange?.send()
      publisher?.subject.value = newValue
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
  
  public struct Publisher: Combine.Publisher {
    
    public typealias Output = T
    
    public typealias Failure = Never
    
    public func receive<Downstream: Subscriber>(subscriber: Downstream)
      where Downstream.Input == T, Downstream.Failure == Never {
        subject.subscribe(subscriber)
    }
    
    fileprivate let subject: Combine.CurrentValueSubject<T, Never>
    
    fileprivate init(_ output: Output) {
      subject = .init(output)
    }
  }
  
  private var publisher: Publisher?
  
  public var objectWillChange: ObservableObjectPublisher?
  
  public var projectedValue: Publisher {
    mutating get {
      if let publisher = publisher {
        return publisher
      }
      let publisher = Publisher(wrappedValue)
      self.publisher = publisher
      return publisher
    }
  }
  
//  public static subscript<EnclosingSelf: AnyObject>(
//      _enclosingInstance object: EnclosingSelf,
//      wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, T>,
//      storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Setting<T>>
//  ) -> T {
//      get {
//          return object[keyPath: storageKeyPath].wrappedValue
//      }
//      set {
//          object[keyPath: storageKeyPath].objectWillChange?.send()
//          object[keyPath: storageKeyPath].publisher?.subject.send(newValue)
//          object[keyPath: storageKeyPath].wrappedValue = newValue
//      }
//      // TODO: Benchmark and explore a possibility to use _modify
//  }
}
