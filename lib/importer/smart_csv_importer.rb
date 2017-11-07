# :nodoc:
module Importer
  # :nodoc:
  class SmartCsvImporter < CustomImporter
    def initialize(file, uri, clazz)
      super(file, uri, clazz)
      @clazz = clazz
      @source = nil
      @table_name = clazz.table_name
      @table_columns = clazz.column_names
      @table_columns = @table_columns.map do |v| v.to_sym end
      DataCleanerService.truncate_table(@table_name)
    end

    def load_dataset
      @uri.nil? ? from_csv : from_uri
    end

    def from_csv
      @source = @file.tempfile
      File.open(@source, "r:bom|utf-8") do |f|	
	 	import(f)
      end
    end

    def from_uri
      require 'open-uri'
      open(@uri, 'r:utf-8') do |f|   # don't forget to specify the UTF-8 encoding!!
         import(f)
      end
    end

    def import(f)
      puts 'importing ...'
      # @clazz.copy_from @source

      SmarterCSV.process(f, {:chunk_size => 1000}).each do |chunk|
	 		items = []
	 		chunk.each do |item|
	 			proceed_flag, datevalue = will_proceed(item)
	 			if proceed_flag == false
	 				next
	 			end
	 			
	 			row = []
	 			@table_columns.each do |v|
	 				if [:name, :place, :event, :venue].include? v
	 					item[v] = titleize(item[v])
	 				elsif [:date].include? v
	 					item[v] = datevalue
	 				end
	 				row << item[v] ||= nil
	 			end
	 			items << row 
	 		end
	 	   @clazz.delay.import @table_columns, items, :validate => false, on_duplicate_key_ignore: true
	  end

    end

    private
    def titleize(str)
      str ||=""
  	  str.ljust(100).strip.gsub(/[\s\t\r\n\f]/, '_').gsub(/\W/, '').titleize
    end

    def process_date(dt)
    	dmy = dt.split '/'
    	return dmy.length == 3 ? Time.new(dmy[2],dmy[1],dmy[0]).to_date : false
    end

    def will_proceed(item)
    	if item[:id].to_i == 0
    		return false, ""
    	end
    	if item.keys.include? :date
	 	  item[:date] = process_date(item[:date] ||="")
	 	  retflag = item[:date]!=false ? true : false
	 	  return retflag, item[:date]
	 	end
	 	return true, ""

    end
  end
end
