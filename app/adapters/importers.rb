# :nodoc:
module Importers
  extend ActiveSupport::Concern
  # :nodoc:
  module ClassMethods
    def import_it(args)
      file, uri = args
      dependency_container = Dry::Container.new
      dependency_container.register 'importer' do
        # Importer::CsvImporter.new(file, uri, self)
        Importer::SmartCsvImporter.new(file, uri, self)
      end
      dependency_container.resolve(:importer).load_dataset
    end
  end
  included do
    acts_as_copy_target
  end
end
