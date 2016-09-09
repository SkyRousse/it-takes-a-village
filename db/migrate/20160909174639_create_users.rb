class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :about, default:""
      t.string :profile_pic, default:""
      t.string :skills, default:""
      t.string :zip, default:""
      t.string :likes_to, default:""
      t.timestamps
    end
  end
end
