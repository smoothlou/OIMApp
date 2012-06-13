module Paperclip
  class StringioAdapter < AbstractAdapter
    def initialize(target)
      @target = target
      @tempfile = copy_to_tempfile(@target)
    end

    attr_writer :original_filename, :content_type

    def original_filename
      @original_filename ||= @target.original_filename if @target.respond_to?(:original_filename)
      @original_filename ||= "stringio.txt"
      @original_filename.strip
    end

    def content_type
      @content_type ||= @target.content_type if @target.respond_to?(:content_type)
      @content_type ||= "text/plain"
      @content_type
    end

    def size
      @target.size
    end

    def fingerprint
     if (@cached_fingerprint.nil?)
       rewind # start reading from the beginning
       @cached_fingerprint = Digest::MD5.hexdigest(read)
       rewind # for later read()
     end
     @cached_fingerprint
    end

    def read(length = nil, buffer = nil)
      @tempfile.read(length, buffer)
    end

    # We don't use this directly, but aws/sdk does.
    def rewind
      @tempfile.rewind
    end

    def eof?
      @tempfile.eof?
    end

    def path
      @tempfile.path
    end

    private

    def copy_to_tempfile(src)
      while data = src.read(16*1024)
        destination.write(data)
      end
      destination.rewind
      destination
    end

  end
end

Paperclip.io_adapters.register Paperclip::StringioAdapter do |target|
  StringIO === target
end
