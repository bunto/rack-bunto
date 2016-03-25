require_relative "helper"


describe "when configuring site" do

  before do
    @tempdir = File.join(TEST_DIR, "tmp")
    FileUtils.mkdir_p(@tempdir)  unless File.exist?(@tempdir)
    Dir.chdir(@tempdir)
  end

  after do
    FileUtils.rmdir(@tempdir)  if File.exist?(@tempdir)
  end

  describe "when no options are given and no config file exists" do

    it "loads the correct default destination" do
      bunto = rack_bunto_without_build
      bunto.destination.must_equal File.join(Dir.pwd, "_site")
    end
  end

  describe "when using default config file" do

    it "loads the configuration from file" do
      begin
        File.open("_config.yml", "w") do |f|
          f.puts "config_file_opt: ok"
        end

        bunto = rack_bunto_without_build
        bunto.config.must_include "config_file_opt"
        bunto.config["config_file_opt"].must_equal "ok"
      ensure
        FileUtils.rm("_config.yml")
      end
    end
  end

  describe "when using custom config file" do

    it "loads the configuration from file" do
      begin
        File.open("_my_config.yml", "w") do |f|
          f.puts "config_file_opt: ok"
        end

        bunto = rack_bunto_without_build(:config => "_my_config.yml")
        bunto.config.must_include "config_file_opt"
        bunto.config["config_file_opt"].must_equal "ok"
      ensure
        FileUtils.rm("_my_config.yml")
      end
    end
  end

  describe "when initialization options are given" do

    it "has the initialization options" do
      bunto = rack_bunto_without_build(:init_opt => "ok")
      bunto.config.must_include "init_opt"
      bunto.config["init_opt"].must_equal "ok"
    end

    it "has the correct destination" do
      bunto = rack_bunto_without_build(:destination => "/project/_site")
      bunto.destination.must_equal "/project/_site"
    end

    it ":auto is not passed on to Bunto" do
      bunto = rack_bunto_without_build(:auto => "ok")
      bunto.config.wont_include "auto"
    end

    it ":force_build is not passed on to Bunto" do
      bunto = rack_bunto_without_build(:force_build => "ok")
      bunto.config.wont_include "force_build"
    end
  end

  describe "when initialization options are given and a config file exists" do

    before do
      File.open("_config.yml", "w") do |f|
        f.puts "config_file_opt: ok"
        f.puts "common_opt:      from config"
        f.puts "destination:     /project/_site_from_config"
      end
    end

    after do
      FileUtils.rm("_config.yml")
    end

    it "has all options and initialization options override file options" do
      bunto = rack_bunto_without_build(:init_opt   => "ok",
                                         :common_opt => "from init")
      bunto.config.must_include "init_opt"
      bunto.config.must_include "config_file_opt"
      bunto.config.must_include "common_opt"
      bunto.config["common_opt"].must_equal "from init"
    end

    it "has the correct destination" do
      bunto = rack_bunto_without_build(:destination => "/project/_site_from_init")
      bunto.destination.must_equal "/project/_site_from_init"
    end
  end
end
