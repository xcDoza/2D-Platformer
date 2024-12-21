extends HBoxContainer

func _ready():
	var baseLevel = get_tree().get_nodes_in_group("base_level")
	
	if((baseLevel).size() > 0):
		baseLevel[0].connect("coin_total_changed", self, "on_total_coin_changed")
		update_display(baseLevel[0].totalCoins, baseLevel[0].collectedCoins)

func update_display(totalCoins, collectedCoins):
	$CoinLabel.text = str(collectedCoins, "/", totalCoins)

func on_total_coin_changed(totalCoins, collectedCoins):
	update_display(totalCoins, collectedCoins)
