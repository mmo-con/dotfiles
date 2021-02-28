#include <iostream>
#include <limits>

int main(int argc, const char **args) {
    if (argc < 2) {
        std::cout << "Missing attribute key data. Exiting ..." << std::endl;
        return 1;
    }

    const std::string argument { args[1] };

    if (argument.length() > 2 && argument.length() < 6) {
        for (const auto& symbol : argument) {
            if (! std::isdigit(symbol)) {
                std::cout << "Input is ill-formed. Exiting ..." << std::endl;
                return 1;
            }
        }
        unsigned long code = std::stoul(argument);
        if (std::numeric_limits<uint16_t>::max() < code) {
            std::cout << "Input is ill-formed. Exiting ..." << std::endl;
            return 1;
        }
        unsigned char first = static_cast<char>((code >> 8) & 0xFF);
        unsigned char second = static_cast<char>(code & 0xFF);
        std::cout << "\"" << first << second << "\"" << std::endl;
    } else if (argument.length() == 1 || argument.length() == 2) {
        uint16_t code = static_cast<uint16_t>(argument[0]) << 8;
        if (argument.length() == 1) {
            code |= static_cast<uint16_t>(' ');
        } else {
            code |= static_cast<uint16_t>(argument[1]);
        }
        std::cout << code << std::endl;
    } else {
        std::cout << "Input is ill-formed. Exiting ..." << std::endl;
        return 1;
    }

    return 0;
}