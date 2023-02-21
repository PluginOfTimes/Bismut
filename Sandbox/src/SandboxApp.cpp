#include <Bismut.h>


class SandboxApp : public Bismut::Application {
public:
	SandboxApp() {

	}

	~SandboxApp() {

	}

};

Bismut::Application* CreateApplication() {
	return new SandboxApp();
}