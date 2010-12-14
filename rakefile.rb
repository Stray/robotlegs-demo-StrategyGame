Dir.glob('rakefiles/*.rb').each { |r| import r }

require 'sprout'
# Optionally load gems from a server other than rubyforge:
# set_sources 'http://gems.projectsprouts.org'
sprout 'as3'

############################################
# Configure your Project Model
project_model :model do |m|
  m.project_name            = 'PyramidGame'
  m.language                = 'as3'
  m.background_color        = '#FFFFFF'
  m.width                   = 800
  m.height                  = 384
  m.keep_as3_metadata       = 'Inject'
  # m.keep_as3_metadata       = 'PostConstruct'
  # m.use_fdb                 = true
  # m.use_fcsh              = true
  # m.preprocessor          = 'cpp -D__DEBUG=false -P - - | tail -c +3'
  # m.preprocessed_path     = '.preprocessed'
  # m.src_dir               = 'src'
  # m.lib_dir               = 'lib'
  # m.swc_dir               = 'lib'
  # m.bin_dir               = 'bin'
  # m.test_dir              = 'test'
  # m.doc_dir               = 'doc'
  # m.asset_dir             = 'assets'
  # m.source_path           << "#{m.lib_dir}/somelib"
  m.compiler_gem_name     = 'sprout-flex4sdk-tool'
  m.compiler_gem_version  = '>= 4.0.0'
  m.source_path           << "#{m.lib_dir}/robotlegs"
  m.source_path           << "#{m.lib_dir}/greensock"
  m.source_path           << "#{m.lib_dir}/robotlegs_utilities_OptionCommandMap"
  m.library_path          << 'lib/as3-signals.swc'
  m.endtoend_test_dir     = 'test/strategy/xendtoendtests'
  m.support_dir           = 'support'  
    
end

def populate_test_task(t)
  t.source_path  << "support" 
  t.source_path  << "lib/mockolate"
  t.library_path << 'lib/asx.swc'
  t.library_path << 'lib/hamcrest.swc'
  t.library_path << 'lib/FLoxy.swc'          
  t.source_path << "lib/robotlegs_utilities_OptionCommandMap"
  t.gem_name     = 'sprout-flex4sdk-tool'
  t.gem_version  = '>= 4.0.0'
end

desc 'Compile and debug the application'
debug :debug do |t|
  t.debug = true
end

desc 'Compile run the test harness'
unit :test do |t|
  populate_test_task(t)
end

desc 'Compile the optimized deployment'
deploy :deploy

desc 'Create documentation'
document :doc

desc 'Compile a SWC file'
swc :swc

desc 'Compile and run the test harness for CI'
ci :cruise

# set up the default rake task
task :default => :debug
