# frozen_string_literal: true
# A candidate for a nursery is a child, that is part of a registration.
# This will also replace the previous relationship between a registration and
# a child.
class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates, id: :uuid do |t|
      t.references :registration, type: :uuid
      t.references :child, type: :uuid

      t.timestamps
    end

    remove_column :registrations, :child_id, :uuid
  end
end
