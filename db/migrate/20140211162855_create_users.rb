class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |shmee|
      shmee.string :email
      shmee.string :first_name
      shmee.string :last_name 
      shmee.date :dob
      shmee.string :gender
      shmee.string :facebook_link
      shmee.string :password
    end
  end
end
