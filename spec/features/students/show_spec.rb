require 'rails_helper'

RSpec.describe "Student show page" do
  before(:each) do
    @student_1 = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    @student_2 = Student.create!(name: "AJ Dorion", age: 44, house: "Ravenclaw")
    @students = [@student_1, @student_2]
    @course_1 = Course.create!(name: "Defense against the Dark Arts")
    @course_2 = Course.create!(name: "Herbology")
    @course_3 = Course.create!(name: "Potions")
    @courses = [@course_1, @course_2, @course_3]
    @student_course_1 = StudentCourse.create!(course_id: @course_1.id, student_id: @student_1.id)
    @student_course_2 = StudentCourse.create!(course_id: @course_2.id, student_id: @student_1.id)
    @student_course_3 = StudentCourse.create!(course_id: @course_3.id, student_id: @student_1.id)
    @student_course_4 = StudentCourse.create!(course_id: @course_1.id, student_id: @student_2.id)
  end

  it "Shows list of the student's courses" do
    visit "/students/#{@student_1.id}"
    expect(page).to have_content("#{@course_1.name}")
    expect(page).to have_content("#{@course_2.name}")
    expect(page).to have_content("#{@course_3.name}")

    visit "/students/#{@student_2.id}"
    expect(page).to have_content("#{@course_1.name}")
  end
end
