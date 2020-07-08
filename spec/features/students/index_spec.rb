require 'rails_helper'

RSpec.describe "Student index" do
  before(:each) do
    @student_1 = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    @student_2 = Student.create!(name: "AJ Dorion", age: 44, house: "Ravenclaw")
    @students = [@student_1, @student_2]
  end

  it "Shows list of students with their details" do
    visit "/students"
    @students.each do |student|
      expect(page).to have_content("Name: #{student.name}")
      expect(page).to have_content("Age: #{student.age}")
      expect(page).to have_content("House: #{student.house}")
    end
  end
end
