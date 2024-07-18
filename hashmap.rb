class Hashmap
  attr_accessor :hash, :load_factor, :capacity, :entries

  def initialize()
    @capacity = 16
    @hash = Array.new(@capacity)
    @load_factor = 0.75
    @entries = 0
  end

  def generate_hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number*hash_code + char.ord}

    hash_code = hash_code % @capacity
  end

  def set(key, value)
    hash_code = generate_hash(key)

    if !@hash[hash_code]
      @hash[hash_code] = LinkedList.new(Node.new(key, value))

      @entries += 1

      if self.load_factor_breached?
        self.rebalance()
      end
    elsif @hash[hash_code].contains?(key)
      @hash[hash_code].at(@hash[hash_code].find(key)).value = value
    else
      @hash[hash_code].append(key, value)

      @entries += 1

      if self.load_factor_breached?
        self.rebalance()
      end
    end
  end

  def get(key)
    hash_code = generate_hash(key)
    @hash[hash_code].at(@hash[hash_code].find(key)).value
  end

  def has?(key)
    hash_code = generate_hash(key)
    @hash[hash_code].contains?(key)
  end

  def remove(key)
    hash_code = generate_hash(key)
    if @hash[hash_code].contains?(key)
      @hash[hash_code].remove(key)
    else
      return nil
    end
  end

  def length
    @entries
  end

  def clear
    @hash = Array.new(@capacity)
    @entries = 0
  end

  def get_entries
    all_entries = []
    for entry in @hash
      if entry
        pointer = entry.head_node
        while pointer
          all_entries << [pointer.key, pointer.value]
          pointer = pointer.next_node
        end
      end
    end
    all_entries
  end

  def rebalance
    @capacity = (@entries/@load_factor) * 3
    all_entries = get_entries

    self.clear

    for entry in all_entries
      self.set(entry[0], entry[1])
    end
  end

  # HELPER METHODS
  def load_factor_breached?
    @entries > @load_factor * @capacity
  end

end
