class AddTypeToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :raffle_types, foreign_key: true
  end
end
