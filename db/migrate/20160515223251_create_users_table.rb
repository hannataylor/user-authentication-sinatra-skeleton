class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, { limit: 20, null: false }
      t.string :email, { limit: 50, null: false }
      t.string :first_name, { limit: 30, null: false }
      t.string :last_name, { limit: 30, null: false }
      t.string :zip, { limit: 5, null: false }
      t.string :password_digest, { null: false }

      t.timestamps(null: false)
    end

  end
end
