extends CanvasLayer

onready var continueButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/ContinueButton
onready var optionButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton
onready var quitButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton

var optionMenuScene = preload("res://scenes/UI/OptionsMenu.tscn")

func _ready():
	continueButton.connect("pressed", self, "on_continue_press")
	optionButton.connect("pressed", self, "on_option_press")
	quitButton.connect("pressed", self, "on_quit_press")
	get_tree().paused = true

func _unhandled_input(event):
	if(event.is_action_pressed("pause")):
		unpause()
		get_tree().set_input_as_handled()

func unpause():
	queue_free()
	get_tree().paused = false
	

func on_continue_press():
	unpause()

func on_option_press():
	var optionMenuInstance = optionMenuScene.instance()
	add_child(optionMenuInstance)
	optionMenuInstance.connect("back_pressed",self, "on_options_back_pressed")
	$MarginContainer.visible = false

func on_quit_press():
	$"/root/ScreenTransitionManager".transition_to_menu()
	unpause()

func on_options_back_pressed():
	$OptionsMenu.queue_free()
	$MarginContainer.visible = true
