class CreateJobfavourits < ActiveRecord::Migration[6.0]
  def change
    create_table :jobfavourits do |t|

      t.timestamps
    end
  end
end
