class AddVisitCounterToUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :visit_counter, :integer, default: 0
  end
end
