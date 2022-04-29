extends Button
export (NodePath) var Label_RollP1 = null
export (NodePath) var Self_but = null
export var Turn_stat = "Roll"

func _ready():
	var glob = get_node("/root/Global")
	glob.Turn_Stat = "Roll"
	pass
func _process(delta):
	var glob = get_node("/root/Global")
	var self_btn = get_node(Self_but)
	if glob.Turn_Stat != "Roll" and glob.Turn % 2 != 1:
		self_btn.disabled = true

func _on_Button_pressed():
	var rng = RandomNumberGenerator.new()
	var glob = get_node("/root/Global")
	rng.randomize()
	if glob.Turn_Stat == "Roll":
		var self_btn = get_node(Self_but)
		var Label_Roll = get_node(Label_RollP1)
		var roll_1 = 1 + rng.randi_range(0,5)
		glob.Roll = roll_1
		var string_roll = str(roll_1)
		Label_Roll.text = "Roll: " + string_roll
		glob.Turn_Stat = "2_Fase"
		self_btn.disabled = true
	else:
		var self_btn = get_node(Self_but)
		self_btn.disabled = true
		pass
pass


