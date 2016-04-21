# Basic Solution to Exercise 1
def pTimes(statement,num)
  i = 0
  while i < num do
    puts statement
    i += 1
  end
end

# A spiffy way to do it
def pTimes2(statement,num)
  num.times do
    puts statement
  end
end

# pTimes('hello',5)

# Exercise 2
def letterCount(str)
  ans = {}
  i = 0
  while i < str.length do
    if ans[str[i]] == nil
      ans[str[i]] = 1
    else
      ans[str[i]] += 1
    end
    i += 1
  end
  ans
end

# puts letterCount 'hello'

# Exercise 3

def mockMe
  while true do
    mock = gets.chomp
    if mock == 'quit' || mock == 'q'
      break
    else
      puts mock
    end
  end
end

# mockMe

# Exercise 4
def printContacts(contacts)
  contacts.each do |k,v|
    puts k, v
  end
end

contactsHash = {'juliana' => '555-555-5555', 'brianna' => '666-666-6666'}
# printContacts contactsHash

# Exercise 5
def getContact(contacts)
  puts contacts
  puts 'Name: '
  name = gets.chomp
  puts 'Phone: '
  phone = gets.chomp
  contacts[name] = phone
  contacts
end

# puts getContact contactsHash

## List exercises
# Enumerable Inject 1
def getSum(arr)
  arr.inject do |memo,x|
    memo + x
  end
end

# puts getSum [1,2,3]

# Enumerable Inject 2
def getMax(arr)
  arr.inject do |memo,x|
    if memo < x
      x
    else
      memo
    end
  end
end

# puts getMax [1,2,5,4,3]

# Enumerable Inject 3
def getMin(arr)
  arr.inject do |memo,x|
    if memo < x
      memo
    else
      x
    end
  end
end

# puts getMin [1,2,-2,5,4,3]

# Enumerable Inject 4
def reverseStr(str)
  str.chars.inject do |memo, x|
    x + memo
  end
end

# puts reverseStr "hello world"

# Enumerable Inject Challenge
def partialSums(arr)
  sums = [0]
  arr.inject(0) do |memo,x|
    sums.push(memo+x)
    memo+x
  end
 sums
end

# p partialSums [1,2,3]

# Array Map 1
def multiplyBy(num,arr)
  arr.map do |x|
    x * num
  end
end

# p multiplyBy 3, [2, 1]

# Array Map 2
def reverseEach(arr)
  arr.map do |x|
    reverseStr x
  end
end

# p reverseEach ['hello','world','juliana']

# Array Map 3
def getResponses(arr)
  arr.map do |x|
    puts x
    gets.chomp
  end
end

# p getResponses ['what?','why?','how?']

## Method Exercises
def factorial(n)
  if n < 2
    1
  else
    n * factorial(n-1)
  end
end

# puts factorial 4

# Method 2
def isPalindrome?(num)
  num_string = num.to_s
  num_string == num_string.reverse
end

# puts is_palindrome? 2442

# Method 3
def reverseStr(str)
  str.reverse
end

# puts reverseStr 'hello'
