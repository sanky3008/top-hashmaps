class LinkedList
  attr_accessor :head_node

  def initialize(head_node = nil)
    @head_node = head_node
  end

  def append(key, value)
    if !@head_node
      @head_node = Node.new(key, value, nil)
    else
      last_node = self.last_node
      new_node = Node.new(key, value, nil)
      last_node.next_node = new_node
    end
  end

  def prepend(key, value)
    new_node = Node.new(key, value, @head_node)
    @head_node = new_node
  end

  def size
    length = 1
    pointer = @head_node
    while pointer.next_node
      pointer = pointer.next_node
      length += 1
    end
    length
  end

  def head
    @head_node.key
  end

  def tail
    self.last_node().key
  end

  def at(index)
    pointer = @head_node
    while index >= 0 do
      if index == 0
        return pointer
      end

      if !pointer.next_node
        puts "\nThere are not enough elements in the list"
      end

      pointer = pointer.next_node
      index -= 1
    end
    pointer
  end

  def remove(key)
    pointer = @head_node
    while pointer
      if !pointer.next_node && pointer.key == key
        value = pointer.value
        @head_node = nil
        return value
      elsif pointer.next_node.key == key
        value = pointer.next_node.value
        pointer.next_node = pointer.next_node.next_node

        return value
      end
    end
  end

  def pop
    pointer = @head_node
    while pointer.next_node.next_node
      pointer = pointer.next_node
    end

    last = pointer.next_node
    pointer.next_node = nil

    return last
  end

  def contains?(key)
    pointer = @head_node
    while pointer
      if pointer.key == key
        return true
      end
      pointer = pointer.next_node
    end

    return false
  end

  def find(key)
    pointer = @head_node
    i = 0
    while pointer
      if pointer.key == key
        return i
      end
      i += 1
    end

    return nil
  end

  def to_s
    pointer = @head_node
    str = ""
    while pointer
      str += "(#{pointer.key}: #{pointer.value}) -> "
      pointer = pointer.next_node
    end

    return str += "nil"
  end

  # HELPER METHODS
  def last_node()
    pointer = @head_node
    while pointer.next_node
      pointer = pointer.next_node
    end
    pointer
  end
end
