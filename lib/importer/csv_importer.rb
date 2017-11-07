# :nodoc:
module Importer
  # :nodoc:
  class CsvImporter < CustomImporter
    def initialize(file, uri, clazz)
      super(file, uri, clazz)
      @clazz = clazz
      @source = nil
    end

    def load_dataset
      @uri.nil? ? from_csv : from_uri
    end

    def from_csv
      @source = @file.tempfile
      import
    end

    def from_uri
      require 'open-uri'
      downloaded_file_name = '/tmp/' + SecureRandom.hex + '.csv'
      download = open(@uri)
      IO.copy_stream(download, downloaded_file_name)
      CSV.new(download).each do |l|
        puts l
      end
      @source = downloaded_file_name
      import
      File.delete(downloaded_file_name)
    end

    def import
      puts 'importing ...'
      @clazz.copy_from @source
    end
  end
end
