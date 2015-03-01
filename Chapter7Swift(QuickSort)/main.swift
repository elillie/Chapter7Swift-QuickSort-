//
//  main.swift
//  Chapter7Swift(QuickSort)
//
//  Created by Ethan Lillie on 9/26/14.
//  Copyright (c) 2014 Algorithms. All rights reserved.
//

import Foundation


class PassableArray {
    var array = [Int]()
    init (array inArray: [Int]) {
        array = inArray
        println(array)
    }
    func exchange(i:Int, j:Int)
    {
        var dummy = array[i]
        array[i] = array[j]
        array[j] = dummy
    }
}

func randomBetweenInclusive(p: Int, r: Int) -> (Int)
{
    return Int(arc4random()%(r-p+1)+p)
}

var A = PassableArray(array:[3,4,2,6,5,9,2,3,4,2,6,5,3,77,77,5,66,43,3,4])
//A.exchange(3, j: 5)
//println(A.array)

func quickSort(A: PassableArray, p: Int, r: Int)
{
    if p<r {
        let q = quickSortPartition(A,p,r)
        println(q)
        quickSort(A, p, q-1)
        quickSort(A, q+1, r)
    }
}

func quickSortPartition(A: PassableArray, p: Int, r: Int) -> (Int)
{
    let x = A.array[r]
    var i = p - 1
    for j in p...r-1 {
        if A.array[j] <= x {
            i = i + 1
            A.exchange(i, j: j)
        }
    }
    A.exchange(i+1, j: r)
    println(A.array)
    return i + 1
}

func randomizedPartition(A: PassableArray, p: Int, r: Int) -> (Int)
{
    var i = randomBetweenInclusive(p, r)
    A.exchange(r, j: i)
    return quickSortPartition(A, p, r)
}

func randomizedQuicksort(A: PassableArray, p: Int, r: Int)
{
    if p<r {
        var q = randomizedPartition(A, p, r)
        randomizedQuicksort(A, p, q-1)
        randomizedQuicksort(A, q+1, r)
    }
}

quickSort(A, 0, 19)
println(A.array)
randomizedQuicksort(A, 0, 19)
println(A.array)
