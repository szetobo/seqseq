class InstallSeqseq < ActiveRecord::Migration
  def self.up
    create_table :auto_sequences do |t|
      t.string  :seq_name
      t.string  :criteria
      t.integer :start_with
      t.integer :step_by
      t.integer :next_val

      t.timestamps
    end

    add_index :auto_sequences, [:seq_name, :criteria], unique: true
  end

  def self.down
    drop_table :auto_sequences
  end
end
