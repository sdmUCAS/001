class CreateEqMaintains < ActiveRecord::Migration
  def change
    create_table :eq_maintains do |t|
      t.string :eqid
      t.string :shyy
      t.string :jxjl
      t.string :hjqk
      t.string :wxf
      t.string :wxr
      t.datetime :Date_x
      t.string :status

      t.timestamps
    end
  end
end
