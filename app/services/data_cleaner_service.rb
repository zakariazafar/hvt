class DataCleanerService
  def self.truncate_table(table_name)
  	ActiveRecord::Base.connection.execute("TRUNCATE #{table_name}")
  end
end