class Employee
  
  attr_accessor :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier 
  end

end

class Manager < Employee
  
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    total_salary = 0
    @employees.each do |employee|
      total_salary += employee.salary 
    end

    bonus = total_salary * multiplier
  end

end

ned = Employee.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)

shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
darren.employees = [shawna, david] 

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000



