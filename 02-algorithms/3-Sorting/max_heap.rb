require_relative 'node'


class MaxHeap
attr_accessor :root

  def insert(value)
    new_node = Node.new(value)
    if @root.nil?
      @root = new_node
    else
      target = search_for_empty([@root], new_node)
      if target.left.nil?
        target.left = new_node
      else
        target.right = new_node
      end
       check_values([@root])
  end

  def search_for_empty(root, new_node)
      new_kids = []
      root.each do |kid|
        if kid.left.nil? || kid.right.nil?
          return kid
        else
          new_kids << kid.left
          new_kids << kid.right
        end
      end
      self.search_for_empty(new_kids, new_node) unless new_kids.empty?
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
        return root[-1]
      else
        return parent_of_last
      end
    end
  end

  def print(children=nil)
    if children.nil?
      puts @root.data
      children = []
      children << @root.left  unless @root.left.nil?
      children << @root.right unless @root.right.nil?
      print(children)
    else
      new_kids = []
      children.each do |kids|
        puts kids.data
        unless kids.left.nil?
          new_kids << kids.left
        end
        unless kids.right.nil?
          new_kids << kids.right
        end
      end
      unless new_kids.empty?
        print(new_kids)
      end
    end
  end

  def delete(data)

    target = find(data)
    unless target.nil?

      last_parent = search_for_parent_of_last([@root])
      if last_parent.nil?
        @root = nil
      else
      # puts last_parent.rating
        if last_parent.right.nil?
          last_node = last_parent.left
          last_parent.left = nil
        else
          last_node = last_parent.right
          last_parent.right = nil
        end

        target.data = last_node.data

        check_values([@root])
      end
    end
  end

  def find(data)
    if @root.data == data
      return @root
    else
      self.search_kids([@root], data)
    end
  end

  def search_kids(kids, data)
    new_kids = []
    kids.each do |kid|
      unless data > kid.data
        if !kid.left.nil? && kid.left.data == data
          return kid.left
        elsif !kid.right.nil? && kid.right.data == data
          return kid.right
        else
          new_kids << kid.left unless kid.left.nil?
          new_kids << kid.right unless kid.right.nil?
        end
      end
    end
    search_kids(new_kids, data) unless new_kids.empty?
  end
end
