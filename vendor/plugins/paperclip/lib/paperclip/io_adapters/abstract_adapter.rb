module Paperclip
  class AbstractAdapter
    private

    def destination
      @destination ||= TempfileFactory.new.generate(original_filename)
    end

    def copy_to_tempfile(src)
      FileUtils.cp(src.path, destination.path)
      destination
    end

    def best_content_type_option(types)
      best = types.reject {|type| type.content_type.match(/\/x-/) }
      if best.size == 0
        types.first.content_type
      else
        best.first.content_type
      end
    end

    def type_from_file_command
      # On BSDs, `file` doesn't give a result code of 1 if the file doesn't exist.
      type = (self.original_filename.match(/\.(\w+)$/)[1] rescue "octet-stream").downcase
      mime_type = (Paperclip.run("file", "-b --mime :file", :file => self.path).split(/[:;\s]+/)[0] rescue "application/x-#{type}")
      mime_type = "application/x-#{type}" if mime_type.match(/\(.*?\)/)
      mime_type
    end
  end
end
