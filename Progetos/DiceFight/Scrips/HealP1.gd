extends Button

export (NodePath) var Self_but = null
export (NodePath) var VidaP1Label = null

func _ready():
	pass 
	
func _process(delta):
	
	var Self_BTN = get_node(Self_but)
	var glob = get_node("/root/Global")

	if glob.Turn_Stat == "2_Fase" and glob.Turn % 2 == 1:
		Self_BTN.disabled = false
	else:
		Self_BTN.disabled = true


func _on_Heal_pressed():
	var Self_BTN = get_node(Self_but)
	var LabelVidaP1 = get_node(VidaP1Label)
	var glob = get_node("/root/Global")
	glob.Turn_Stat = "end_Fase"
	Self_BTN.disabled = true

	glob.Vida_P1 = glob.Vida_P1 + glob.Roll
	if glob.Vida_P1 > 7:
		glob.Vida_P1 = 7
	else:
		glob.Turn += 1
		glob.Turn_Stat = "Roll"
	LabelVidaP1.text = "Vida " + str(glob.Vida_P2) + "/7"
	pass
