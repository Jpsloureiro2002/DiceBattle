extends Button

func _on_Back_pressed():
	var glob = get_node("/root/Global")
	glob.Vida_P1 = 7
	glob.Roll = 0
	glob.Vida_P2 = 7
	glob.Roll_P2 = 3
	glob.Turn = 1
	glob.Turn_Stat = "Roll"
	glob.End = false
	glob.Winner = "null"
	get_tree().change_scene("res://Cenes/Menu.tscn")
	pass
