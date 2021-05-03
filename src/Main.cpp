//
//
//  SDL2 C++ boilerplate for VSCode -- only tested on MacOS so far
//  Requires SDL2 and SDL-image installed using Brew
//  Maintained by Nathan Davenport (@nathandaven on github)
//
//

#include "Global.h"

int main(int argc, const char *argv[])
{
    if (SDL_Init(SDL_INIT_VIDEO) < 0)
    {
        std::cout << "SDL init failed." << std::endl;
        return 1;
    }

    std::cout << "SDL Init succeeded." << std::endl;

    SDL_Quit();

    return 0;
}
