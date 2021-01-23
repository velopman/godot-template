extends Node

export ( Array, Resource ) var scenes

var __scenes_by_name = {}


func _ready() -> void:
	for scene in self.scenes:
		var scene_name = scene.get_state().get_node_name( 0 )
		self.__scenes_by_name[ scene_name ] = scene


func load_scene( name: String ) -> void:
	if name in self.__scenes_by_name:
		self.get_tree().change_scene_to( self.__scenes_by_name[ name ] )
	else:
		push_error( "Could not load scene with name: %s" % name )
