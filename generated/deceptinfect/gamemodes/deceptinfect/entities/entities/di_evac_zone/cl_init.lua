ENT.Base = "base_brush"
ENT.Type = "brush"

function ENT:Think()
	if (not self._gHaxeInit) then
		self:Initialize()
	end
end


function ENT:Initialize()
	local ent = deceptinfect.di_evac_zone.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeInit = true
end

