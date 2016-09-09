class RenameCareerToCompetition < ActiveRecord::Migration[5.0]
  def change
    rename_table :careers, :competitions
  end
end
