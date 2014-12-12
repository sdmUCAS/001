class CreateYyInformations < ActiveRecord::Migration
  def change
    create_table :yy_informations do |t|
      t.string :yyid
      t.string :eqid
      t.string :eqdwid
      t.string :pname
      t.sting :dw
      t.string :zw
      t.string :addr
      t.string :postno
      t.string :email
      t.string :phoneno
      t.string :symd
      t.string :syyq
      t.string :jhsj
      t.datetime :yyrq
      t.datetime :czrq

      t.timestamps
    end
  end
end
