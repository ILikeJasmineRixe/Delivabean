extends Node2D


# Called when the node enters the scene tree for the first time.
# func _ready() -> void:
	# pass # Replace with function body.
	# dont think i need this? docs say smth about on scene starting but i aint using that
	
	


var timeElapsed := 0.0
var running := true
var hasItem := false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if running:
		timeElapsed += delta
		$CanvasLayer/LabelForTimer.text = "%.2f" % timeElapsed
		
		
func itemPickedUp() -> void:
	hasItem = true
		
func finishedDelivery() -> void:
	if hasItem:
		running = false
		var bruger = get_node("mc").get_node("BeanBurger")
		$CanvasLayer/LabelForTimer.text = "Delivery FInished! You took %.2f seconds to complete!" % timeElapsed
		get_node("mc").set_physics_process(false)
		
		if bruger:
			get_node("mc").remove_child(bruger)
			get_node("House").add_child(bruger)
			bruger.position = Vector2(0, -20)
			bruger.z_index = 10
