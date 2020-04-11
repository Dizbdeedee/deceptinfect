package deceptinfect.ecswip;

class System {

    #if client
    function init_client() {
    }
    function run_client() {

    }
    #end
    #if server
    function init_server() {

    }
    function run_server() {

    }
    #end
    function init_shared() {

    }
    function run_shared() {

    }

    public function new() {
        
    }

    public final function init() {
        #if client
        init_client();
        #elseif server
        init_server();
        #end
        init_shared();
    }
    public final function run() {
        #if client
        run_client();
        #elseif server
        run_server();
        #end
        run_shared();
    }

    

}