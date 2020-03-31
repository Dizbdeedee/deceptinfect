
function EFFECT:Init(...)
	local ent = deceptinfect_HAXE_EXPORT.effect_di_test.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Init(...)
end

