class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :place
      t.bigint :addressable_id
      t.string :addressable_type
      t.timestamps
    end
    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
