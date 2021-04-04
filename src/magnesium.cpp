#include <iostream>
#include "argparse.hpp"
#include <filesystem>
#include <git2.h>
#include <fstream>

namespace fs = std::filesystem;

bool exists(const std::string &path) {
    return fs::exists(fs::path(path));
}

int main(int argc, char *argv[]) {
    git_libgit2_init();

    argparse::ArgumentParser args("mg", "0.0.1");

    args.add_argument("-i", "--input")
            .help("specify a list of repositories to operate on");

    try {
        args.parse_args(argc, argv);
    }
    catch (const std::runtime_error &err) {
        std::cout << err.what() << std::endl;
        std::cout << args;
        return 1;
    }

    std::vector<fs::path> repos;

    try {
        if (exists(args.get("-i"))) {
            std::cout << "Using repo list " + args.get("-i") << std::endl;

            std::ifstream file(args.get("-i"));
            std::string line;
            while (std::getline(file, line)) {
                if (exists(line + "/.git")) {
                    repos.emplace_back(line);
                } else {
                    std::cout << line + " is not a Git repo!" << std::endl;
                }
            }
        } else {
            std::cout << "Specified input file doesn't exist!" << std::endl;
            return 1;
        }
    }
    catch (std::logic_error &err) {
        for (const fs::directory_entry &item : fs::directory_iterator(fs::current_path())) {
            if (item.is_directory() && exists(item.path().string() + "/.git")) {
                repos.emplace_back(item);
            }
        }
    }

    for (const fs::path &item : repos) {
        std::cout << item.string() << std::endl;
    }

    return 0;
}
