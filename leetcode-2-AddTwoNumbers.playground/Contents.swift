//: Playground - noun: a place where people can play

//import Foundation

/**
 原题连接
 
 https://leetcode.com/problems/add-two-numbers/description/
 内容描述
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 
 **/

class ListNode  {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

let l1 = ListNode.init(2)
let l1Next = ListNode.init(4)
l1.next = l1Next
l1Next.next = ListNode.init(3)

let l2 = ListNode.init(5)
let l2Next = ListNode.init(6)
l2.next = l2Next
l2Next.next = ListNode.init(4)

//全部变成数字做加法再换回去
func addTwoNumbers(list1: ListNode?, list2: ListNode?) -> Int {
   
    var l1 = list1!
    var l2 = list2!
    var val1 = "\(l1.val)"
    var val2 = "\(l2.val)"
    //取出链表中的数,拼接在一起
    while let next = l1.next {
        val1.append(String(describing: next.val))
        l1 = next
    }
    while let next2 = l2.next {
        val2.append(String(describing:next2.val))
        l2 = next2
    }
//    反向 相加
    let resultNumber = Int(String(val1.reversed()))! + Int(String(val2.reversed()))!
    
    return resultNumber
}

print(addTwoNumbers(list1: l1, list2: l2))


// 是用递归
func addTwoNumbers2(list1: ListNode?, list2: ListNode?) -> ListNode? {
    
    guard let l1 = list1 else {
        return list2
    }
    
    guard let l2 = list2 else {
        return list1
    }
    
    var list3 : ListNode
    if l1.val + l2.val < 10 {
        list3 = ListNode.init(l1.val + l2.val)
        list3.next = addTwoNumbers2(list1: l1.next, list2: l2.next)
    }
    else {
        list3 = ListNode.init(l1.val + l2.val - 10)
        let temp = ListNode(1)
        list3.next = addTwoNumbers2(list1: l1.next, list2: addTwoNumbers2(list1: l2.next, list2: temp))
    }
    return list3
}

var list = addTwoNumbers2(list1: l1, list2: l2)
let list2 = list?.next

if let value = list?.val {
    var result = String(value)
    while  let next = list?.next {
        result.append(String(next.val))
        list = next
    }
    print(result)
}

