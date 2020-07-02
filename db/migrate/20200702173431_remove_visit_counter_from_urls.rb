class RemoveVisitCounterFromUrls < ActiveRecord::Migration[5.1]
  def change
    remove_column :urls, :visit_counter, :integer
  end
end
