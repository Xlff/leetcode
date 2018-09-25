//: Playground - noun: a place where people can play

/**
 Given a string, find the length of the longest substring without repeating characters.
 
 Example 1:
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Example 2:
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Example 3:
 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 思路
 
 粗一看是dp，细一看是greedy
 
 我们先从第一个字符开始，只要碰到已经出现过的字符我们就必须从之前出现该字符的index开始重新往后看。
 
 例如‘xyzxlkjh’，当看到第二个‘x’时我们就应该从y开始重新往后看了。
 
 那么怎么判断字符已经出现过了呢？我们使用一个hashmap，将每一个已经阅读过的字符作为键，而它的值就是它在原字符串中的index，如果我们现在的字符不在hashmap里面我们就把它加进hashmap中去，因此，只要目前的这个字符在该hashmap中的值大于等于了这一轮字符串的首字符，就说明它已经出现过了，我们就将首字符的index加1，即从后一位又重新开始读，然后比较目前的子串长度与之前的最大长度，取大者。
 */

let str = "aacdde"

func longSubstringWithRepeatingChar(_ string : String) -> Int {
    
    var longest = 0 // substring 的长度
    var left = 0 // 起始位置
    var set = Set<Character>()
    let chars = Array(string)
    ///adad
    for (i, char) in chars.enumerated() {
        // 判断当前char 是否在集合中
        if set.contains(char) {
            // 若在 更新longest
            longest = max(longest, i - left)
            // 若当前char 不等于left处的元素, 从集合中移除left处的元素, 继续校验
            while chars[left] != char {
                set.remove(chars[left])
                left += 1
            }
            left += 1
        }
        else {
            set.insert(char)
        }
    }
    print(longest)
    print(chars.count - left)
    return max(longest, chars.count - left)
}

longSubstringWithRepeatingChar("adad")



