
class RlmediatorGenerator < Sprout::Generator::NamedBase  # :nodoc:

  def manifest
    record do |m|
#      m.class_collisions class_dir, "#{class_name}Controller", "#{class_name}ControllerTest", "#{class_name}Helper"

      if(!user_requested_test)
        m.directory full_class_dir
        m.template 'RLMediator.as', full_class_dir + '/' + class_name + 'Mediator.as'
      end
 
      m.directory full_test_dir
      m.template 'TestCase.as', full_test_dir + '/' + class_name + 'MediatorTest.as'
      
      m.template 'TestSuite.as', File.join(test_dir, 'AllTests.as'), :collision => :force
    end
  end
    
end
