////////////////////////////////////////////////////////////////////////////////
//
//  FileName    : TimelineD.h
//  Version     : 1.0
//  Creator     : Windle
//  Create Date : 2017/11/11   11:46
//  Comment     : 
//	Todo		: ��ʵʱ��, ��Ϸʱ��, ��Ϸ�������, 
//
////////////////////////////////////////////////////////////////////////////////
#pragma once
#include "engine.h"
#include "engine\KSingleton.h"
#include "..\03.System\SystemBase.h"

namespace ECS {
	class TimelineD : public TSystemBase<SYS_TIMELINE>, public TSingleton<TimelineD>
	{
	public:
		TimelineD();

		int FixedUpdate();

		uint32	now();
		uint32	GetCurrentFrame();
	};

};
