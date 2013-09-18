class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
    	t.string 	:number, null: false
    	t.integer :user_id
    	t.integer :event_id
    	t.integer :status
    	t.boolean	:used, default: false
      t.integer :row
      t.integer :seat
      t.timestamps
    end

    add_index :tickets, :event_id
    add_index :tickets, :user_id

  end
end
