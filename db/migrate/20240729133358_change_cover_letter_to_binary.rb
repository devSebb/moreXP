class ChangeCoverLetterToBinary < ActiveRecord::Migration[7.1]
  def change
    change_column :applications, :cover_letter, :binary, using: 'cover_letter::bytea'
  end
end
