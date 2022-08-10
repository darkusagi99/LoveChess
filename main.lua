function love.load()

	-- Graphics options
	love.graphics.setDefaultFilter("nearest","nearest")
	love.graphics.setBackgroundColor(0,0,200)

	board = {}

	boardHeight = 8
	boardWidth = 8

	-- Initalisation plateau 
	for row = 1, boardHeight do
		board[row] = {} 
		for col = 1, boardWidth do 
			board[row][col] = 0
		end 
	end

	-- Init graphics
	spriteImage = love.graphics.newImage("Sprites.png")
	blackSquare = love.graphics.newQuad(0, 16, 16, 16, spriteImage:getDimensions())
	whiteSquare = love.graphics.newQuad(16, 16, 16, 16, spriteImage:getDimensions())

	-- Init variables pour l'affichage
	startX = 56
	startY = 0 -- 16*3 + 8
	incY = 8
	incX = 8

	-- Calcul du différentiel pour l'affichage
	renderWidth = 128
	renderHeight = 144

	-- Calcul des ratios d'affichage
	screenWidth, screenHeight = love.graphics.getDimensions( )
	scaleX = screenWidth / renderWidth
	scaleY = screenHeight / renderHeight

	-- Version
	version = "0.001"

end

function love.draw()	
	
	-- Application du ration pour avoir du plein écran
	love.graphics.scale( scaleX, scaleY )
	
	local drawX = startX
	local drawY = startY
	
	-- Loop on board matrix
	for row = 1, boardHeight do
		for col = 1, boardWidth do 
			if ((row + col) %2 == 0) then
				love.graphics.draw(spriteImage, blackSquare, startX + (col * incX) - (row * incX), startY + (col * incY) + (row * incY))
			else
				love.graphics.draw(spriteImage, whiteSquare, startX + (col * incX) - (row * incX), startY + (col * incY) + (row * incY))
			end
			
		end 
	end
	
	
end

function love.update(dt)
	
end


-- Fonction de détection des touches
function love.keypressed(key)

	-- ECHAP => Fermeture programme
	if key == 'escape' then
		love.event.quit()
	end
	
end
