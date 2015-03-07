docReady = require 'doc-ready'
Phaser = require 'phaser-ce'

cursors = null
game = null
platforms = null
player = null
score = 0
scoreText = null
stars = null

collectStar = (player, star) ->
	# Removes the star from the screen
	star.kill()

	# Add and update the score
	score += 10
	scoreText.text = "Score: #{score}"

preload = ->
	game.load.image 'sky', 'images/sky.png'
	game.load.image 'ground', 'images/platform.png'
	game.load.image 'star', 'images/star.png'
	game.load.spritesheet 'dude', 'images/dude.png', 32, 48

create = ->
	game.physics.startSystem Phaser.Physics.ARCADE

	game.add.sprite 0, 0, 'sky'

	# The platforms group contains the ground and the 2 ledges we can jump on
	platforms = game.add.group()
	# We will enable physics for any object that is created in this group
	platforms.enableBody = on

	# Here we create the ground.
	ground = platforms.create 0, game.world.height - 64, 'ground'
	# Scale it to fit the width of the game (the original sprite is 400x32 in size)
	ground.scale.setTo 2, 2
	# This stops it from falling away when you jump on it
	ground.body.immovable = on

	# Now let's create two ledges
	ledge = platforms.create 400, 400, 'ground'
	ledge.body.immovable = on
	ledge = platforms.create -150, 250, 'ground'
	ledge.body.immovable = on

	# The player and its settings
	player = game.add.sprite 32, game.world.height - 150, 'dude'
	# We need to enable physics on the player
	game.physics.arcade.enable player
	# Player physics properties. Give the little guy a slight bounce.
	player.body.bounce.y = 0.2
	player.body.gravity.y = 300
	player.body.collideWorldBounds = on
	# Our two animations, walking left and right.
	player.animations.add 'left', [0, 1, 2, 3], 10, on
	player.animations.add 'right', [5, 6, 7, 8], 10, on

	cursors = game.input.keyboard.createCursorKeys()

	stars = game.add.group()
	stars.enableBody = on
	# Here we'll create 12 of them evenly spaced apart
	for i in [0..11]
		# Create a star inside of the 'stars' group
		star = stars.create(i * 70, 0, 'star')
		# Let gravity do its thing
		star.body.gravity.y = 6
		# This just gives each star a slightly random bounce value
		star.body.bounce.y = 0.7 + Math.random() * 0.2

	scoreText = game.add.text 16, 16, 'score: 0',
		fill: '#000'
		fontSize: '32px'

update = ->
	game.physics.arcade.collide stars, platforms

	game.physics.arcade.overlap player, stars, collectStar, null, @

	# Collide the player and the stars with the platforms
	hitPlatform = game.physics.arcade.collide player, platforms

	# Reset the players velocity (movement)
	player.body.velocity.x = 0
	if cursors.left.isDown
		# Move to the left
		player.body.velocity.x = -150
		player.animations.play 'left'
	else if cursors.right.isDown
		# Move to the right
		player.body.velocity.x = 150
		player.animations.play 'right'
	else
		# Stand still
		player.animations.stop()
		player.frame = 4
	# Allow the player to jump if they are touching the ground.
	if cursors.up.isDown and player.body.touching.down and hitPlatform
		player.body.velocity.y = -350

docReady ->
	game = new Phaser.Game 800, 600, Phaser.AUTO, 'game', {preload, create, update}
