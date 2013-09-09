class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string 		:title
    	t.text 			:description
    	t.integer 	:place_id
    	t.date 			:scheduled_at_date
    	t.time 			:scheduled_at_time
      t.timestamps
    end

    add_index :events, :place_id
    add_index :events, :scheduled_at_date

  end
end
