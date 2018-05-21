module M
  def report
    puts "'report' method in module M"
  end
end

class C
  include M
end

class D < class
end

obj = D.new
obj.report