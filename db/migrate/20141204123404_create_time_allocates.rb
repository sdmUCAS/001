class CreateTimeAllocates < ActiveRecord::Migration
  def change
    create_table :time_allocates do |t|
      t.string :eqid
      t.string :eqname
      t.string :yyid
      t.string :syrq
      t.string :bz

      t.timestamps
    end
  end
end
