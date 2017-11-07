# :nodoc:
module Exporters
  extend ActiveSupport::Concern
  # :nodoc:
  module ClassMethods
    def export_processing(dataset)
      dependency_container = Dry::Container.new
      dependency_container.register 'exporter' do
        Exporter::JsonExporter.new(dataset)
      end
      dependency_container.resolve(:exporter).export_dataset
    end
  end  
end
