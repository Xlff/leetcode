//: Playground - noun: a place where people can play

//import UIKit

/**
 https://leetcode.com/problems/two-sum/
 https://leetcode-cn.com/problems/two-sum/description/
 给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
 你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
 
 > 示例：
 给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 
 */

print("------111111-----------")

func twoSum1(_ nums: [Int], _ target: Int) -> (Int, Int) {
//    let sets = Set(nums)
//    for num in nums {
//        if nums.contains(target - num) && num != target - num {
//            return (nums.index(of: num)!, nums.index(of: target - num)!)
//        }
//    }
    for i in 0..<nums.endIndex {
        for j in 0..<nums.endIndex {
            if nums[i] + nums[j] == target && i != j {
                return (i ,j)
            }
        }
    }
    
    fatalError("未找到")
}
print(twoSum1([22, 7, 7, 12, 15], 14))

print("------2222222-----------")
func twoSum2(_ nums: [Int], _ target: Int) -> (Int, Int) {
    var lookup = [Int : Int]()
    for (index, number) in nums.enumerated() {
        if lookup.keys.contains(target - number)  {
            return (lookup[target - number]! , index)
        }
        lookup[number] = index
    }
    fatalError("未找到")
}

print(twoSum2([2, 7, 7, 11, 15], 14))

print("------333333-----------")

//func twoSum3(_ nums:[Int], _ target : Int) -> (Int, Int) {
//    
//    for (k, i) in nums.enumerated() {
//        print(k)
//        print(i)
//        print("\n")
//    }
//    
//    
//    fatalError("未找到")
//}
//
//print(twoSum3([2, 7, 7, 11, 15], 14))


