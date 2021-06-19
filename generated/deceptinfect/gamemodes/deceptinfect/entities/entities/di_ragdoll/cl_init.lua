ENT.Base = "base_entity"
ENT.Type = "anim"

function ENT:Think()
	if (not self._gHaxeInit) then
		self:Initialize()
	end
end


function ENT:Initialize()
	local ent = __deceptinfect_ents.di_ragdoll.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
	self._gHaxeInit = true
end

