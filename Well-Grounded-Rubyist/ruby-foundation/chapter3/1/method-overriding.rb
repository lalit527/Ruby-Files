class C
  def m
    puts "First definition of method m"
  end
  def m
    puts "Second definition of method m"
  end
end

C.new.m

## Reopening Classes

class C
  def x
  end
end

class C
  def x
  end

  def y
  end
end

## 
puts Time.new.strftime("%m-%d-%y")