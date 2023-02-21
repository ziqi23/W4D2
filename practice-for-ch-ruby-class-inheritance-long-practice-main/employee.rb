class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        assign_manager
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end

    def assign_manager
        @boss.team << self unless @boss.nil?
    end
end