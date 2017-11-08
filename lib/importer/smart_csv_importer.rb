# :nodoc:
module Importer
  # :nodoc:
  class SmartCsvImporter < CustomImporter
    def initialize(file, uri, clazz)
      super(file, uri, clazz)
      @clazz = clazz
      @source = nil
      @table_name = clazz.table_name
      @table_columns = clazz.column_names.map(&:to_sym)
      DataCleanerService.truncate_table(@table_name)
    end

    def load_dataset
      @uri.nil? ? from_csv : from_uri
    end

    def from_csv
      @source = @file
      File.open(@source, 'r:bom|utf-8') do |f|
        import(f)
      end
      File.delete(@file)
    end

    def from_uri
      require 'open-uri'
      open(@uri, 'r:utf-8') do |f|
        import(f)
      end
    end

    def import(f)
      SmarterCSV.process(f, chunk_size: 1000).each do |chunk|
        items = []
        chunk.each do |item|
          proceed_flag, datevalue = will_proceed(item)
          next unless proceed_flag != false
          items << get_row(item, datevalue)
        end
        @clazz.import @table_columns, items,
                      validate: false, on_duplicate_key_ignore: true
      end
    end

    private

    def get_row(item, datevalue)
      row = []
      @table_columns.each do |v|
        if %i[name place event venue].include? v
          item[v] = titleize(item[v])
        elsif %i[date].include? v
          item[v] = datevalue
        end
        row << item[v] ||= nil
      end
      row
    end

    def titleize(str)
      str ||= ''
      str.to_s.ljust(100).strip
         .gsub(/[\s\t\r\n\f]/, '_')
         .gsub(/\W/, '').titleize
    end

    def process_date(dt)
      DatetimeUtilsService.process_date_from_string(dt)
    end

    def will_proceed(item)
      return [false, ''] if item[:id].to_i.zero?
      if item.keys.include? :date
        item[:date] = process_date(item[:date] ||= '')
        retflag = item[:date] != false
        return [retflag, item[:date]]
      end
      [true, '']
    end
  end
end
