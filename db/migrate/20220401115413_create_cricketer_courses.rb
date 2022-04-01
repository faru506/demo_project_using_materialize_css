class CreateCricketerCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :cricketer_courses do |t|
      t.integer :cricketer_id
      t.integer :course_id
      t.timestamps
    end
  end
end
