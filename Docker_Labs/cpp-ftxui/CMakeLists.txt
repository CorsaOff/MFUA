cmake_minimum_required(VERSION 3.10)
project(ftxui_demo)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)
FetchContent_Declare(ftxui
  GIT_REPOSITORY https://github.com/ArthurSonzogni/FTXUI.git
  GIT_TAG v5.0.0
)
FetchContent_MakeAvailable(ftxui)

add_executable(ftxui_demo main.cpp)

target_link_libraries(ftxui_demo PRIVATE
  ftxui::component
  ftxui::dom
  ftxui::screen
)