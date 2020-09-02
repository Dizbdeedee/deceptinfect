ENT.Base = "base_anim"
ENT.Type = "anim"

function ENT:Think()
	if (not self._gHaxeInit) then
		self:Initialize()
	end
end


function ENT:Initialize()
	local ent = deceptinfect.di_charger.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeInit = true
end

function ENT:Draw(...)
	self._gHaxeBurrow:Draw(...)
end

