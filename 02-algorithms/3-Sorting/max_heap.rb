require_relative 'node'
# attr_reader :root

class MaxHeap

  def insert (value)
    new_node = Node.new(value)
    if @root.nil?
      @root = node
    else
      parent_of_empty = search_for_empty([@root], new_node)
      if target.left.nil?
        target.left = node
      else
        target.right = node
      end
      check_values([@root])
  end

  def search_for_empty(root, node)
      new_kids = []
      root.each do |kid|
        if kid.left.nil? || kid.right.nil?
          return kid
        else
          new_kids << kid.left
          new_kids << kid.right
        end
      end
      self.search_for_empty(new_kids, node) unless new_kids.empty?
    end
  end

  def check_values(root)
    new_kids = []
    change = false
    root.each do |kid|
      if !kid.left.nil? && kid.left.data > kid.data
        temp_data = kid.data
        kid.data = kid.left.data
        kid.left.data = temp_data
        if @root.data == temp_data
          @root.data = kid.data
        end
        change = true
      end

      if !kid.right.nil? && kid.right.data > kid.data
        temp_data = kid.data
        kid.data = kid.right.data
        kid.right.data = temp_data
        if @root.data == temp_data
          @root.data = kid.data
        end
        change = true
      end

      new_kids << kid.left unless kid.left.nil?
      new_kids << kid.right unless kid.right.nil?
    end
    if !new_kids.empty?
      self.check_values(new_kids)
    elsif change == true
      self.check_values([@root])
    end
  end


    def search_for_parent_of_last(root)
    new_kids = []
     previous_kid = nil #maybe this?
    root.each do |kid|
      if kid.left.nil? && kid.right.nil?
        return previous_kid
      elsif kid.left.nil? || kid.right.nil?
        return kid
      else
        new_kids << kid.left
        new_kids << kid.right
      end
      previous_kid = kid
    end
    unless new_kids.empty?
      parent_of_last = self.search_for_parent_of_last(new_kids)
      if parent_of_last.nil?
        # puts root[-1].rating
        return root[-1]
      else
        return parent_of_last
      end
    end
  end

end
