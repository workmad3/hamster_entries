class AddMembershipNameAndHamsteryNameToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :membership_name
      t.string :hamstery_name
      t.text :address
    end
  end
end
