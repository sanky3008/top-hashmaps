# Ruby Hashmap Implementation

This project implements a custom Hashmap data structure in Ruby, using separate chaining for collision resolution - as a part of The Odin Project.

## Files

- `hashmap.rb`: Main Hashmap class implementation
- `LinkedList.rb`: Linked List class for collision chains
- `Node.rb`: Node class for Linked List elements
- `main.rb`: Example usage of the Hashmap

## Features

- Dynamic resizing with load factor
- Basic Hashmap operations: set, get, remove, clear
- Collision handling using linked lists

## Usage

```ruby
require_relative "hashmap"
require_relative "LinkedList"
require_relative "Node"

map = Hashmap.new()
map.set("key", "value")
value = map.get("key")
```

## Implementation Details

- Initial capacity: 16
- Load factor: 0.75
- Hash function: Uses character codes and prime number (31) for distribution

## Running the Example

Execute `main.rb` to see the Hashmap in action:

```
ruby main.rb
```

This will demonstrate basic operations and the hashmap's behavior under various inputs.