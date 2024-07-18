require_relative "hashmap"
require_relative "LinkedList"
require_relative "Node"

test = Hashmap.new()
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

test.set('moon', 'silver')

puts test.hash

puts test.capacity
puts test.load_factor
puts test.entries
puts test.capacity * test.load_factor
