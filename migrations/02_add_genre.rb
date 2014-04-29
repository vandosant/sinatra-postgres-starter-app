Sequel.migration do
  up do
    alter_table(:artists) do
      add_column :genre, :text, :null=>false
    end
  end

  down do
    alter_table(:artists) do
      drop_column :genre
    end
  end
end