class BoatingTest

    @@all = []

    def self.all
        @@all
    end
    attr_accessor :status
    attr_reader :student, :name, :instructor

    def initialize(student, name, status, instructor)
        @student = student
        @name = name
        @status = status
        @instructor = instructor

        self.class.all << self
    end
end
