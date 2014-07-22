require 'dotenv'

Dotenv.load(File.expand_path('../.env', __FILE__))

task :default => [:build]

desc 'Build the image'
task :build, :template do |t, args|
  template = args.template
  chdir template do
    sh <<-EOS
      export PACKER_LOG="true"
      export PACKER_LOG_PATH="$PWD/packer.log"
      rm -rf vendor/cookbooks
      bundle exec berks vendor vendor/cookbooks && \
        packer build -force -only=virtualbox-iso template.json
    EOS
  end
end

desc 'Generate a Vagrantfile'
task :gen_vagrantfile, :box do |t, args|
  sh("sed -e 's/{{box}}/#{args.box}/g' Vagrantfile.template > Vagrantfile")
end

desc 'Upload a box'
task :upload, :box, :name do |t, args|
  bucket = ENV['BOX_BUCKET']
  config = File.join(File.dirname(__FILE__), '.s3cfg')
  config = ENV['S3CFG'] unless File.exist?(config)
  cmd = 's3cmd'
  # Set custom config or current directory config if it was given
  cmd << " -c #{config}" unless config.empty?
  name = args.name || args.box
  cmd << " --acl-public put #{args.box}.box s3://#{bucket}/#{name}.box"
  sh cmd
end
