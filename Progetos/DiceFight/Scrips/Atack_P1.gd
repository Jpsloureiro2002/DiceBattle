extends Button
export (NodePath) var Self_but = null
export (NodePath) var VidaP2Label = null

func _ready():
	pass 
	
func _process(delta):
	
	var Self_BTN = get_node(Self_but)
	var glob = get_node("/root/Global")

	if glob.Turn_Stat == "2_Fase" and glob.Turn % 2 == 1:
		Self_BTN.disabled = false
	else:
		Self_BTN.disabled = true


func _on_Atack_pressed():
	var Self_BTN = get_node(Self_but)
	var LabelVidaP2 = get_node(VidaP2Label)
	var glob = get_node("/root/Global")
	glob.Turn_Stat = "end_Fase"
	
	Self_BTN.disabled = true

	glob.Vida_P2 = glob.Vida_P2 - glob.Roll
	if glob.Vida_P2 < 0:
		glob.Vida_P2 = 0
	else:
		glob.Turn = glob.Turn + 1
		glob.Turn_Stat = "Roll"
	print(glob.Turn)
	LabelVidaP2.text = "Vida " + str(glob.Vida_P2) + "/7"
	pass
