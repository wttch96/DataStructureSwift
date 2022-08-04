//
//  BST.swift
//  DataStructureSwift
//
//  Created by Wttch on 2022/8/3.
//

import Foundation

///
/// 二叉排序树 (Binary Sort Tree), 又称二叉查找树 (Binary Search Tree)
///
/// 平均查找时间为 O(log n).
///
/// 缺点: 当插入的数据有序时, 将会退化为链表, 此时时间复杂度为 O(n).
///
struct BST<T> where T : Comparable {
    // 头部节点
    private var root: BiTreeNode<T>? = nil
    
    mutating public func insert(_ val: T) {
        if let node = root {
            insert(node, val)
        } else {
            root = BiTreeNode(val)
        }
    }
    
    public func exists(_ val: T) -> Bool {
        if let node = root { return exists(node, val) }
        return false
    }
    
    private func exists(_ node: BiTreeNode<T>, _ val: T) -> Bool {
        if node.val == val {
            // 相等
            return true
        }
        
        if let left = node.left {
            if node.val > val {
                if exists(left, val) { return true }
            }
        }
        if let right = node.right {
            if node.val < val {
                if exists(right, val) { return true }
            }
        }
        return false
    }
    
    mutating private func insert(_ node: BiTreeNode<T>, _ val: T) {
        // 值相等都往左侧偏重
        if val <= node.val {
            if let left = node.left {
                insert(left, val)
            } else {
                node.left = BiTreeNode(val)
            }
        } else {
            if let right = node.right {
                insert(right, val)
            } else {
                node.right = BiTreeNode(val)
            }
        }
    }
}
///
/// 二叉树节点
///
fileprivate class BiTreeNode<T> {
    var val: T
    var left: BiTreeNode<T>? = nil
    var right: BiTreeNode<T>? = nil
    init(_ val: T, left: BiTreeNode<T>? = nil, right: BiTreeNode<T>? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}
