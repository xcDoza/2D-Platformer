extends CanvasLayer


func _ready():
	$MarginContainer/PanelContainer/MarginContainer/VBoxContainer/NextLevelButton.connect("pressed", self, "on_next_button_pressed")
	$MarginContainer/PanelContainer/MarginContainer/VBoxContainer/RestartButton.connect("pressed", self, "on_restart_button_pressed")

func on_restart_button_pressed():
	$"/root/LevelManager".restart_level()
	
func on_next_button_pressed():
		$"/root/LevelManager".increment_level()
