# Basic Solution to Exercise 1
def p_times(statement,num)
  i = 0
  while i < num do
    puts statement
    i += 1
  end
end

# A spiffy way to do it
def p_times2(statement,num)
  num.times do
    puts statement
  end
end

# p_times2('hello',5)

# Exercise 2
def letter_count(str)
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

def letter_count2(str)
  ans = {}
  str.each_char do |c|
    if ans.has_key? c
      ans[c] += 1
    else
      ans[c] = 1
    end
  end
  ans
end

# puts letter_count 'hello'

# Exercise 3

def mock_me
  while true do
    mock = gets.chomp
    if mock == 'quit' || mock == 'q'
      break
    else
      puts mock
    end
  end
end

# mock_me

# Exercise 4
def print_contacts(contacts)
  contacts.each do |k,v|
    puts k, v
  end
end

contacts_hash = {'juliana' => '555-555-5555', 'brianna' => '666-666-6666', 'jenny' => "867-5309"}
# print_contacts contacts_hash

# Exercise 5
def get_contact(contacts)
  puts contacts
  puts 'Name: '
  name = gets.chomp
  puts 'Phone: '
  phone = gets.chomp
  contacts[name] = phone
  contacts
end

# puts get_contact contacts_hash

def get_contacts(existing_contacts)
  puts "add contact? (y or n)"
  add_contact = gets.chomp.downcase == "y"
  while add_contact do
    get_contact(existing_contacts)
    puts "add another contact? (y or n)"
    add_contact = gets.chomp.downcase == "y"
  end
  existing_contacts
end

# puts get_contacts contacts_hash

## List exercises
# Enumerable Inject 1
def get_sum(arr)
  arr.inject do |memo, x|
    memo + x
  end
end

# puts get_sum [1,2,3]

# Enumerable Inject 2
def get_max(arr)
  arr.inject do |memo, x|
    if memo < x
      x
    else
      memo
    end
  end
end

# puts get_max [1,2,5,4,3]

# Enumerable Inject 3
def get_min(arr)
  arr.inject do |memo,x|
    if memo < x
      memo
    else
      x
    end
  end
end

# puts get_min [1,2,-2,5,4,3]

# Enumerable Inject 4
def reverse_str(str)
  str.chars.inject do |memo, x|
    x + memo
  end
end

# puts reverse_str "hello world"

# Enumerable Inject Challenge
def partial_sums(arr)
  sums = [0]
  arr.inject(0) do |memo,x|
    sums.push(memo+x)
    memo+x
  end
 sums
end

# p partial_sums [1,2,3]

# Array Map 1
def multiply_by(num,arr)
  arr.map do |x|
    x * num
  end
end

# p multiply_by 3, [2, 1]

# Array Map 2
def reverse_each(arr)
  arr.map do |x|
    reverse_str x
  end
end

# p reverse_each ['hello','world','juliana']

# Array Map 3
def get_responses(arr)
  arr.map do |x|
    puts x
    gets.chomp
  end
end

# p get_responses ['what?','why?','how?']

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
def is_palindrome?(num)
  num_string = num.to_s
  num_string == num_string.reverse
end

# puts is_palindrome? 2442

# Method 3
def reverse_str(str)
  str.reverse
end

# puts reverse_str 'hello'
