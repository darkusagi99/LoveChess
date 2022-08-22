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
			board[row][col] = nil
		end 
	end
	

	-- Init graphics
	spriteImage = love.graphics.newImage("Sprites.png")
	blackSquare = love.graphics.newQuad(0, 16, 16, 16, spriteImage:getDimensions())
	whiteSquare = love.graphics.newQuad(16, 16, 16, 16, spriteImage:getDimensions())
	
	cursorSquare = love.graphics.newQuad(224, 16, 16, 16, spriteImage:getDimensions())
	selectionSquare = love.graphics.newQuad(240, 16, 16, 16, spriteImage:getDimensions())
	
	-- Init pieces Quads
	whitePawn = love.graphics.newQuad(32, 0, 16, 32, spriteImage:getDimensions())
	blackPawn = love.graphics.newQuad(48, 0, 16, 32, spriteImage:getDimensions())
	whiteTower = love.graphics.newQuad(64, 0, 16, 32, spriteImage:getDimensions())
	blackTower = love.graphics.newQuad(80, 0, 16, 32, spriteImage:getDimensions())
	whiteBishop = love.graphics.newQuad(96, 0, 16, 32, spriteImage:getDimensions())
	blackBishop = love.graphics.newQuad(112, 0, 16, 32, spriteImage:getDimensions())
	whiteKnight = love.graphics.newQuad(128, 0, 16, 32, spriteImage:getDimensions())
	blackKnight = love.graphics.newQuad(144, 0, 16, 32, spriteImage:getDimensions())
	whiteQueen = love.graphics.newQuad(160, 0, 16, 32, spriteImage:getDimensions())
	blackQueen = love.graphics.newQuad(176, 0, 16, 32, spriteImage:getDimensions())
	whiteKing = love.graphics.newQuad(192, 0, 16, 32, spriteImage:getDimensions())
	blackKing = love.graphics.newQuad(208, 0, 16, 32, spriteImage:getDimensions())

	-- Init pieces
	-- 0 -> empty
	-- 1 -> White pawn
	for col = 1, boardWidth do 
		board[7][col] = whitePawn
	end 
	-- 2 -> White tower
	board[8][1] = whiteTower
	board[8][8] = whiteTower
	-- 3 -> White knight
	board[8][2] = whiteKnight
	board[8][7] = whiteKnight
	-- 4 -> White bishop
	board[8][3] = whiteBishop
	board[8][6] = whiteBishop
	-- 5 -> White queen
	board[8][5] = whiteQueen
	-- 6 -> White king
	board[8][4] = whiteKing
	-- 7 -> Black pawn
	for col = 1, boardWidth do 
		board[2][col] = blackPawn
	end 
	-- 8 -> Black tower
	board[1][1] = blackTower
	board[1][8] = blackTower
	-- 9 -> Black knight
	board[1][2] = blackKnight
	board[1][7] = blackKnight
	-- 10 -> Black bishop
	board[1][3] = blackBishop
	board[1][6] = blackBishop
	-- 11 -> Black queen
	board[1][5] = blackQueen
	-- 12 -> Black king
	board[1][4] = blackKing

	-- Init variables pour l'affichage
	startX = 56
	startY = 0 -- 16*3 + 8
	incY = 8
	incX = 8
	spriteOffset = 16

	-- Calcul du différentiel pour l'affichage
	renderWidth = 128
	renderHeight = 144

	-- Calcul des ratios d'affichage
	screenWidth, screenHeight = love.graphics.getDimensions( )
	scaleX = screenWidth / renderWidth
	scaleY = screenHeight / renderHeight

	-- Version
	version = "0.001"
	
	-- Cursor / selection vars
	cursorX = 1
	cursorY = 1
	selectionX = nil
	selectionY = nil

end

function love.draw()	
	
	-- Application du ration pour avoir du plein écran
	love.graphics.scale( scaleX, scaleY )
	
	local drawX = startX
	local drawY = startY
	
	-- Loop on board matrix
	for row = 1, boardHeight do
		for col = 1, boardWidth do 
		
			-- Draw board
			if ((row + col) %2 == 0) then
				love.graphics.draw(spriteImage, blackSquare, startX + (col * incX) - (row * incX), startY + (col * incY) + (row * incY))
			else
				love.graphics.draw(spriteImage, whiteSquare, startX + (col * incX) - (row * incX), startY + (col * incY) + (row * incY))
			end
			
			-- Draw selection
			if row == selectionX and col == selectionY then
				love.graphics.draw(spriteImage, selectionSquare, startX + (col * incX) - (row * incX), startY + (col * incY) + (row * incY))
			end
			
			-- Draw cursor
			if row == cursorX and col == cursorY then
				love.graphics.draw(spriteImage, cursorSquare, startX + (col * incX) - (row * incX), startY + (col * incY) + (row * incY))
			end
			
			-- Draw pieces			
			if board[row][col] ~= nil then
				love.graphics.draw(spriteImage, board[row][col], startX + (col * incX) - (row * incX), startY + (col * incY) + (row * incY) - spriteOffset)
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
