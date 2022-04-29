extends Node2D
export var Difficulty = 5
export (NodePath) var Roll_P2 = null
export (NodePath) var Timer_AI = null
onready var timer1 = get_node(Timer_AI)

func run_timer(time):
	timer1.set_wait_time(time)
	timer1.set_timer_process_mode(0)
	timer1.start()
	return true
func heal(roll):
	var glob = get_node("/root/Global")
	glob.Vida_P2 = glob.Vida_P2 + roll
	if glob.Vida_P2 > 7:
		glob.Vida_P2 = 7
		glob.Turn += 1
		glob.Turn_Stat = "Roll"
	else:
		glob.Turn += 1
		glob.Turn_Stat = "Roll"
	pass
func atack(roll):
	var glob = get_node("/root/Global")
	glob.Vida_P1 = glob.Vida_P1 - roll
	if glob.Vida_P1 < 0:
		glob.Vida_P1 = 0
		glob.Turn_Stat = "Roll"
		glob.Turn += 1
		glob.Winner = "Player 2"
		glob.End = true
	else:
		glob.Turn += 1
		glob.Turn_Stat = "Roll"
	pass

func _process(delta):
	var glob = get_node("/root/Global")
	var hp = glob.Vida_P2
	var Roll = 0
	var hp_P1 = glob.Vida_P1
	var P1_roll = glob.Roll
	var check = false
	if glob.Turn % 2 == 0 and glob.Turn_Stat == "Roll":
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		Roll = 1 + rng.randi_range(0,5)
		var Roll_p2 = get_node(Roll_P2)
		Roll_p2.text = "Roll: " + str(Roll)
		glob.Turn_Stat = "2_Fase"
		check = run_timer(10)
	if (glob.Turn % 2 == 0 and glob.Turn_Stat == "2_Fase") and check == true:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var rand_action = rng.randi_range(0,1)
		if hp_P1 <= Roll:
			atack(Roll)
		elif (hp + Roll >= 6 or Roll >= 5 and hp < 6) and rand_action == 0:
			heal(Roll)
		elif (((hp + Roll >= 6 or Roll >= 5) and hp < 6) and hp_P1 < 5) and rand_action == 1:
			atack(Roll)
		elif hp < 4:
			heal(Roll)
		else:
			atack(Roll)
		pass
