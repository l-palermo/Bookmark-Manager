require 'database_connection'

RSpec.describe DatabaseConnection do

  describe '#.setup' do

    it 'set a connection to the database'do
    allow(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#.query' do

    it 'execute the correct SQL string' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      allow(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
