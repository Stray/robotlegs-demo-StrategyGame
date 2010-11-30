
class RoboteyesTestGenerator < Sprout::Generator::NamedBase  # :nodoc:

  def manifest
    record do |m|
#      m.class_collisions class_dir, "#{class_name}Controller", "#{class_name}ControllerTest", "#{class_name}Helper"

      m.directory full_test_dir
      m.template 'TestCase.as', model.endtoend_test_dir + '/' + class_name + 'EndToEndTest.as'
      
      m.template 'TestSuite.as', File.join(test_dir, 'AllTests.as'), :collision => :force
    end
  end
    
end
