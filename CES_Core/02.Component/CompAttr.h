#pragma once
#include "..\01.Entity\Entity.h"

namespace ECS {

	struct CompAttr : public Component
	{
		CompAttr(){}
		int			ndir;
		int			moveX;
		int			moveZ;
		int			bUpdate;	// ͬ�����,�ĳ�comp?
	};
}