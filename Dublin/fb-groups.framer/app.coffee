# Import file "view-transition"
sketch = Framer.Importer.load("imported/view-transition@1x")

# Wrap image in ScrollComponent
scroll = ScrollComponent.wrap(sketch.group)
scroll.scrollHorizontal = false

# Add a little padding for the navigation bar
scroll.contentInset = 
	bottom: 90

# Post layer
sketch.post.x = 0
sketch.post.y = Screen.height
	
# Prevent dragging beyond top
scroll.onScroll ->
	if scroll.scrollY <= 0
		scroll.scrollY = 0

# Push post-view 
sketch.write.onClick ->
	sketch.post.animate 
		properties:
			y: 0
		curve: "spring(400,35,0)"

# Cancel post-view	
sketch.cancel.onClick ->
	sketch.post.animate 
		properties:
			y: Screen.height
		curve: "spring(400,35,0)"