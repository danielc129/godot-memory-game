extends CanvasLayer

var buttons
var correctOrder = []
var currentGuessIndex = 0
var level = 1
var random
var started = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOverText.hide()
	randomize()
	buttons = get_tree().get_nodes_in_group("button")
	random = RandomNumberGenerator.new()
	disableButtons()

func disableButtons():
	for button in buttons:
		button.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func showMemory():
	uncolorAll()
	correctOrder.clear()
	$LevelText.set_text("Level: " + str(level))
	
	for n in buttons:
		n.disabled = true
	
	for n in level:
		var random_index = random.randi() % buttons.size()
		var selectedButton = buttons[random_index]
		correctOrder.append(random_index)
		selectedButton.modulate = Color("007dec")
		await get_tree().create_timer(0.5).timeout
		selectedButton.modulate = Color(1,1,1)
		await get_tree().create_timer(0.5).timeout
		
	for n in buttons:
		n.disabled = false
	
	level += 1
	currentGuessIndex = 0

func checkGuess(buttonIndex):
	if buttonIndex == correctOrder[currentGuessIndex]:
		return true
	return false

func _on_start_button_pressed():
	var random = RandomNumberGenerator.new()
	$GameOverText.hide()
	print("starting game")
	started = true
	showMemory()
	
func gameOver():
	started = false
	level = 1
	$GameOverText.show()
	for n in buttons:
		n.disabled = true
	
func handleButtonPress(buttonIndex):
	
	if not started:
		return
	
	print(correctOrder)
	print(buttonIndex)
	print(currentGuessIndex)
	if checkGuess(buttonIndex):
		currentGuessIndex += 1
		print("guessed correctly")
		
		if currentGuessIndex >= correctOrder.size():
			for n in buttons:
				n.disabled = true
			await get_tree().create_timer(0.8).timeout
			showMemory() 
	else:
		print("failed")
		gameOver()
		
func colorPress(buttonIndex):
	if checkGuess(buttonIndex):
		buttons[buttonIndex].modulate = Color("007dec")
	else:
		buttons[buttonIndex].modulate = Color(1,0,0)
		
func unColorPress(buttonIndex):
	if started:
		buttons[buttonIndex].modulate = Color(1,1,1)
	else: # failed
		buttons[correctOrder[currentGuessIndex]].modulate = Color("007dec")
		
func uncolorAll():
	for n in buttons:
		n.modulate = Color(1,1,1)
		

func _on_button_pressed():
	handleButtonPress(0)


func _on_button_2_pressed():
	handleButtonPress(1)


func _on_button_3_pressed():
	handleButtonPress(2)


func _on_button_4_pressed():
	handleButtonPress(3)


func _on_button_5_pressed():
	handleButtonPress(4)


func _on_button_6_pressed():
	handleButtonPress(5)


func _on_button_7_pressed():
	handleButtonPress(6)


func _on_button_8_pressed():
	handleButtonPress(7)


func _on_button_9_pressed():
	handleButtonPress(8)
	

func _on_button_button_down():
	colorPress(0)

func _on_button_button_up():
	unColorPress(0)


func _on_button_2_button_down():
	colorPress(1)


func _on_button_2_button_up():
	unColorPress(1)


func _on_button_3_button_down():
	colorPress(2)


func _on_button_3_button_up():
	unColorPress(2)


func _on_button_4_button_down():
	colorPress(3)


func _on_button_4_button_up():
	unColorPress(3)


func _on_button_5_button_down():
	colorPress(4)


func _on_button_5_button_up():
	unColorPress(4)


func _on_button_6_button_down():
	colorPress(5)


func _on_button_6_button_up():
	unColorPress(5)


func _on_button_7_button_down():
	colorPress(6)


func _on_button_7_button_up():
	unColorPress(6)


func _on_button_8_button_down():
	colorPress(7)


func _on_button_8_button_up():
	unColorPress(7)


func _on_button_9_button_down():
	colorPress(8)


func _on_button_9_button_up():
	unColorPress(8)
