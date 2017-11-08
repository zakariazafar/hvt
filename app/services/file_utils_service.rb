# :nodoc:
class FileUtilsService
  def self.move_temp_file(tmpfile)
    require 'fileutils'
    dest_file_name = '/tmp/' + SecureRandom.hex + '.csv'
    FileUtils.mv(tmpfile.tempfile, dest_file_name)
    dest_file_name
  end
end
