class RemoveScheduledAtDateFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :scheduled_at_date, :date
  end
end
