editbox = {}
editbox.__index = editbox

function editbox:create()
    local instance = {}
    setmetatable(instance, editbox)
    if instance:constructor() then
        return instance
    end
    return false
end

function editbox:constructor()
	self = editbox;
	self.screen = Vector2(guiGetScreenSize())
	self.width, self.height = 300, 200
	self.sizeX, self.sizeY = (self.screen.x-self.width), (self.screen.y-self.height)

	self.text = 'text me'
	self.char = string.len(self.text)+1

	addEventHandler('onClientRender', root, self.render, true, 'low-10')
	addEventHandler('onClientCharacter', root, function(...) self:write(...) end)
	bindKey('backspace', 'down', self.delete)
end

function editbox:render()
	self = editbox;
	dxDrawText(self.text, self.sizeX/2, self.sizeY/2, 25, 25, tocolor(255,255,255,255), 1, 'pricedown')
end

function editbox:write(character)
	self = editbox;
	self.text = ''..self.text..''..character
    self.char = string.len(self.text)+1
end

function editbox:delete()
	self = editbox;
	if string.len(self.text) > 0 then
		local fistPart = self.text:sub(0, self.char-1)
		local lastPart = self.text:sub(self.char+1, #self.text)
		self.text = fistPart..lastPart
		self.char = string.len(self.text)
	end
end

editbox:create()