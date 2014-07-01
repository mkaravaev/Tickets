class ChangeDateFormatInEvents < ActiveRecord::Migration
  def change
   remove_column :events, :scheduled_at_time, :date
   add_column :events, :scheduled_at_time, :datetime
  end
end

