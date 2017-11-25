class RemoveIntroductionFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :introduction, :string
  end
end
