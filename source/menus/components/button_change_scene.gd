extends TextureButton


export (String) var scene_name


func _ready() -> void: 
	self.connect( "button_up", self, "change_scene" )


func change_scene() -> void:
	SceneManager.load_scene( self.scene_name )
