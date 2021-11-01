//
//  Protocol-Practice.swift
//  DailyCoding
//
//  Created by Aphananthe on 2021/01/09.
//
//  Protocolの練習, 試し書き

import Foundation

protocol Inspection {
    var positive: Int { get }   //陽性者数
    var negative: Int { get }   //陰性者数
    var positivePercentage: Double { get }  //陽性者率
}

extension Inspection {  //Protocol extension -> extension内に書いた場合は中身も実装しなければならない
    var AmountOfInfected: Int {     //総検査数
        return positive + negative
    }
}

struct Tokyo: Inspection {  //Protocol Extension内で書いたものは任意実装となるので、AmountOfInfectedは書かなくてもよい
    var positive: Int
    var negative: Int
    var positivePercentage: Double {
        return Double(positive) / Double(positive + negative)
    }
}

let tokyo = Tokyo(positive: 1563, negative: 14253)  //数字はテキトー
let percentageOfPositiveAtTokyo = tokyo.positivePercentage
