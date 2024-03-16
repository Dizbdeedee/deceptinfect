package deceptinfect.ecswip;

import deceptinfect.ecswip.ReplicatedComponent.ReplicatedTarget;

class ClientRepresentationTarget extends ReplicatedComponent {
	@:s var target:DI_ID;

	public function new(repl:ReplicatedTarget, target:DI_ID) {
		super();
		#if server
		replicated = repl;
		#end
		this.target = target;
	}
}
