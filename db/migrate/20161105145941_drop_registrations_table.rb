# frozen_string_literal: true
# Drop the broken registrations table. It is not used yet and can be created by
# again the next migration.
class DropRegistrationsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :registrations do |t|
      t.uuid :id
    end
  end
end
