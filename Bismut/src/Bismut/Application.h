#pragma once

#include "Core.h"


// Core applications class all Bismut application should inherit from

namespace Bismut {

	class BISMUT_API Application {
	public:
		Application();
		virtual ~Application();

		void Run();

	};

}