# :nodoc:
module Exporter
  # :nodoc:
  class JsonExporter < CustomExporter
    def initialize(dataset)
      @dataset = dataset
    end

    def export_dataset
      { dataset: @dataset.to_json, type: 'json' }
    end
  end
end
