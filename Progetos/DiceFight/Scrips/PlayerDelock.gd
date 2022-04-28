extends Node2D
export (NodePath) var delock = null
export (NodePath) var Vida_P1 = null
export (NodePath) var Vida_P2 = null
export (NodePath) var LabelRonda = null

func _process(delta):
	var glob = get_node("/root/Global")
	var label = get_node(Vida_P1)
	label.text = "Vida: " + str(glob.Vida_P1) + "/7"
	var label2 = get_node(Vida_P2)
	label2.text = "Vida: " + str(glob.Vida_P2) + "/7" 
	var delock_ = get_node(delock)
	var LabelRondas = get_node(LabelRonda)
	LabelRondas.text = "Ronda: " + str(glob.Turn)
	
	if glob.Turn_Stat == "Roll" and glob.Turn % 2 == 1:
		delock_.disabled = false
