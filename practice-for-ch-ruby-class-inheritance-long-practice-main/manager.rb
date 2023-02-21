require_relative "employee"

class Manager < Employee
    
    attr_accessor :team
    def initialize(name, title, salary, boss = nil)
        super
        @team = []
        #build_team
    end

    def bonus(multiplier)
        #if person is mgr, then recursivel iterate through their team and sum up salary , otherwise if we land on a person who is not manager, then we add only their salary
        #should end w total balance, which we pass to multi
        salary_sum = 0
        queue = team.dup
        until queue.empty?
            person = queue.shift
            if person.is_a?(Manager)
                queue.concat(person.team)
            end
            salary_sum += person.salary
        end
        salary_sum * multiplier
    end

end

alex = Manager.new("alex", "ceo", 1000)
bob = Manager.new("bob", "analyst", 10, alex)
taylor = Employee.new("taylor", "finance",15, bob)
p alex.bonus(5)
p bob.bonus(5)
p taylor.bonus(1)