class CreateJobresponces < ActiveRecord::Migration[6.0]
  def change
    create_table :   do |t|
      t.belongs_to :submitting
      t.string :Status
      
      t.timestamps
    end
  end
end
