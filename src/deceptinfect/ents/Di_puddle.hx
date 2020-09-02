package deceptinfect.ents;

import gmod.structs.MeshVertex;
import gmod.sent.SentBuild.EntFields;
import gmod.gclass.IMesh;

class Di_puddle extends gmod.sent.SentBuild<gmod.sent.ENT_BRUSH> {

    static final material = Gmod.Material("editor/wireframe");

    static var mesh:Null<IMesh> = null;

    final properties:EntFields = {
        Base : "Woogie"
    }

    #if client

    override function Draw() {
        mesh.Draw();
    }

    #end

    override function Initialize() {
        mesh = Gmod.Mesh(material.a);
        // final triangles:Array<MeshVertex> = [
        //     {}
        // ];
        // mesh.BuildFromTriangles();
       
 }

}
