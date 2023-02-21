#pragma once

#include "Application.h"


// Entrypoint for all Bismut applications

extern Bismut::Application* CreateApplication();

int main(int argc, char* argv[]) {

	auto app = CreateApplication();

	app->Run();

	delete app;
}