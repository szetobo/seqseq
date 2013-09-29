class InstallSeqseq < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.string  :seq_name
      t.string  :criteria
      t.integer :start_with
      t.integer :step_by
      t.integer :next_val

      t.timestamps
    end

    add_index :<%= table_name %>, [:seq_name, :criteria], unique: true
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
