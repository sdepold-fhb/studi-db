class AddFieldsToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :matriculation_number, :integer
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :birthday, :date
    add_column :students, :place_of_birth, :string
    add_column :students, :study_course, :string
    add_column :students, :nationality, :string
    add_column :students, :current_term, :integer, :default => 0
    add_column :students, :street, :string
    add_column :students, :house_number, :string
    add_column :students, :zip_code, :integer
    add_column :students, :city, :string
    remove_column :students, :name
    remove_column :students, :family_name
    remove_column :students, :birthdate
  end

  def self.down
    remove_column :students, :city
    remove_column :students, :zip_code
    remove_column :students, :house_number
    remove_column :students, :street
    remove_column :students, :current_term
    remove_column :students, :nationality
    remove_column :students, :study_course
    remove_column :students, :place_of_birth
    remove_column :students, :birthday
    remove_column :students, :last_name
    remove_column :students, :first_name
    remove_column :students, :matriculation_number
  end
end
