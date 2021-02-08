class CreateJoinTableUserMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :join_table_user_messages do |t|
      t.belongs_to :private_message, index: true
      t.references :recipient, index: true
    end
  end
end
