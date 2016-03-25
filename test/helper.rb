require "minitest/autorun"
require "stringio"
require "time"
require "rack/mock"

require_relative "../lib/rack/bunto"

TEST_DIR = File.expand_path("..", __FILE__)


def silence_warnings
  original_verbose, $VERBOSE = $VERBOSE, nil

  yield
ensure
  $VERBOSE = original_verbose
end

def silence_output
  original_stderr, original_stdout = $stderr, $stdout
  $stderr, $stdout = StringIO.new, StringIO.new

  yield
ensure
  $stderr, $stdout = original_stderr, original_stdout
end

def without_processing
  silence_warnings do
    Bunto::Site.class_eval do
      alias :original_process :process
      def process; end
    end
  end

  yield
ensure
  silence_warnings do
    Bunto::Site.class_eval do
      alias :process :original_process
      remove_method :original_process
    end
  end
end

def rack_bunto(options = {})
  bunto = nil
  silence_output do
    bunto = Rack::Bunto.new(options)
  end

  bunto
end

def rack_bunto_without_build(options = {})
  bunto = nil
  without_processing do
    bunto = rack_bunto(options)
  end

  bunto
end

def file_must_exist(filename)
  assert File.exist?(filename),
         "Expected file `#{filename}' to exist."
end

def file_wont_exist(filename)
  assert !File.exist?(filename),
         "Expected file `#{filename}' to not exist."
end
