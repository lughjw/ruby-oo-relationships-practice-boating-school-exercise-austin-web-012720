class Student
    @@all = []

    def self.all
        @@all
    end

    def self.find_student(first_name)
        self.all.find do |student|
            student.first_name == first_name
        end
    end

    attr_reader :first_name

    def initialize(first_name)
        @first_name = first_name

        self.class.all << self
    end

    def add_boating_test(boating_test_name, boating_test_status, instructor)
        BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
    end

    def grade_percentage
        my_tests = BoatingTest.all.select do |bt|
            bt.student == self
        end

        passed_tests = my_tests.select do 
            |bt| bt.status == 'passed'
        end

        percent = passed_tests.size.to_f / my_tests.size.to_f * 100
        percent.round(2)
    end

end
