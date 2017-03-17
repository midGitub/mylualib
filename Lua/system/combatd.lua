CombatD = {}

-- A攻击B 1次
function CombatD:Attack(A, B)
	local action = A.action:queryAction("attack", B);
	if not action then
		return debug("No Action", A);
	end
	--print(Val2Str(action));
	local msg = action.action:gsub("#A", A.name)
		:gsub("#B", B.name)
		:gsub("#HIR#", "<color=red>")
		:gsub("#HIC#", "<color=pink>")
		:gsub("#HIG#", "<color=green>")
		:gsub("#HIB#", "<color=blue>")
		:gsub("#HIW#", "<color=yellow>")
		:gsub("#HIY#", "<color=yellow>")
		:gsub("#NOR#", "</color>")
	pl(msg);

	-- 闪避，招架，命中 轮盘
	local attack = A.action:queryAttack()
	local dodge = B.action:queryDodge();

	local damage = 0;
	if attack * 100 / (attack + dodge) > random(100) then
		damage = B.action:receiveDamage(A.action:queryDamage());
	else
		pl("但是没有命中!")
	end
end

function CombatD:fight(A, B)
	while (1) do
		if A:dead() or B:dead() then return end
		self:Attack(A, B);
		if A:dead() or B:dead() then return end
		self:Attack(B, A);
	end
end

pl("CombatD Startup!!!")
