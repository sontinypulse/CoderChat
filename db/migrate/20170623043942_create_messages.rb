class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.integer :sender_id
      t.integer :recipent_id
      t.datetime :read_at

      t.timestamps
    end
  end
end
