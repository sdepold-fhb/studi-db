class AddFieldsToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :number, :integer
    add_column :courses, :title, :string
    add_column :courses, :description, :text
    add_column :courses, :lacturer, :string
    add_column :courses, :term, :string
  end

  def self.down
    remove_column :courses, :term
    remove_column :courses, :lacturer
    remove_column :courses, :description
    remove_column :courses, :title
    remove_column :courses, :number
  end
end
