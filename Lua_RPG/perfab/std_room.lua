std_room = {}

function std_room:create(entity)
	entity:AddComponent("env")
end

return std_room;