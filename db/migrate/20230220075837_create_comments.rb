class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment_name
      t.bigint :commentable_id
      t.string :commentable_type
      t.references :comments, :user, foreign_key: true
      t.timestamps
    end
  end
end
