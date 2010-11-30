package <%= package_name %> {
	
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;
	
	public class <%= class_name %> extends ModuleContextView {
		
		public function <%= class_name %>() {
			
			context = new <%= class_name %>Context(this);
			
		} 
	}
}