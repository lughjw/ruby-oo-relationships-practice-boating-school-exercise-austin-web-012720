require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
student_goober = Student.new("Goober")
student_booger = Student.new("Booger")
student_orman = Student.new("Orman")

instructor_diana = Instructor.new("Diana")
instructor_liban = Instructor.new("Liban")

check_rigging = "Check Rigging"
leave_slip = "Leave the Slip"
come_about = "Come About"

student_orman.add_boating_test(check_rigging, 'inconclusive', instructor_diana)
instructor_diana.fail_student(student_orman, leave_slip)
instructor_liban.pass_student(student_orman, come_about)

instructor_diana.pass_student(student_goober, leave_slip)

instructor_diana.fail_student(student_booger, check_rigging)


# In BoatingTest.all there should be 5 records:
#   student_orman on check_rigging, leave_slip, and come_about with status 'inconclusive', 'failed', 'passed', respectively
#   student_goober on check_rigging with status 'passed'
#   student_booger on leave_slip with status 'failed'
#
# Doing instructor_liban.pass_student(student_booger, check_rigging) should not add a record. It should only update the already existing record.


binding.pry
0 #leave this here to ensure binding.pry isn't the last line

