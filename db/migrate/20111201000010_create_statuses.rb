class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :uid
      t.string :screen_name
      t.string :id_str
      t.string :text
      t.datetime :created_at
      t.boolean :protected
      t.integer :in_reply_to_status_id
      t.integer :in_reply_to_user_id
      t.string :in_reply_to_screen_name
      t.integer :status_count
      t.integer :friends_count
      t.integer :followers_count
      t.string :source
    end
  end
end
