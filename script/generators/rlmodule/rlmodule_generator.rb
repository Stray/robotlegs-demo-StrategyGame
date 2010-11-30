
class RlmoduleGenerator < Sprout::Generator::NamedBase  # :nodoc:

  def manifest
    record do |m|
#      m.class_collisions class_dir, "#{class_name}Controller", "#{class_name}ControllerTest", "#{class_name}Helper"

      if(!user_requested_test)
        m.directory full_class_dir
        m.template 'RLModule.as', full_class_path
        m.template 'RLModuleMediator.as', full_class_dir + '/' + class_name + 'Mediator.as'
        m.template 'RLModuleContext.as', full_class_dir + '/' + class_name + 'Context.as'
      end
 
      m.directory full_test_dir
      m.template 'RLModuleTest.as', full_test_case_path
      m.template 'RLModuleMediatorTest.as', full_test_dir + '/' + class_name + 'MediatorTest.as'
      m.template 'RLModuleContextTest.as', full_test_dir + '/' + class_name + 'ContextTest.as'
      
      m.template 'TestSuite.as', File.join(test_dir, 'AllTests.as'), :collision => :force
    end
  end
    
end
