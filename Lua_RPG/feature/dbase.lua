local dbase = class {
	hp = 100,
	maxhp = 100,
	mp = 100,
	maxmp = 100,
	sp = 100,
	maxsp = 100,

	str = 10,
	int = 10,
	dex = 10,
	con = 10,

	kar = 10,
	per = 10,
}

function dbase:_ctor(actor)
	self.actor = actor;
end

return dbase;
