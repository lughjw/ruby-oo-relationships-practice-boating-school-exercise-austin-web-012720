class Instructor
    @@all = []

    def self.all
        @@all
    end

    attr_reader :name

    def initialize(name)
        @name = name

        self.class.all << self
    end

    def pass_student(student, boating_test_name)
        test_student(student, boating_test_name, 'passed')
    end

    def fail_student(student, boating_test_name)
        test_student(student, boating_test_name, 'failed')
    end

    private
    def test_student(student, boating_test_name, status)
        boating_test = BoatingTest.all.find do |bt|
            bt.student == student && bt.name == boating_test_name
        end

        if boating_test == nil
            boating_test = BoatingTest.new(student, boating_test_name, status, self)
        else
            boating_test.status = status
        end

        boating_test
    end
end
