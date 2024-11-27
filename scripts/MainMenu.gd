extends CanvasLayer

onready var playButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton
onready var optionsButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton
onready var quitButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton

func _ready():
	playButton.connect("pressed", self, "on_play_pressed")
	optionsButton.connect("pressed", self, "on_options_pressed")
	
func on_play_pressed():
	$"/root/LevelManager".change_level(0)

func on_options_pressed():
	get_tree().quit()
