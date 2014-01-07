class AddFilesToTransaction < ActiveRecord::Migration
  def change
 add_attachment :transactions , :file
   end
end
