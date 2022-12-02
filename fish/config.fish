# vim: ft=fish
function fish_greeting
    if [ "$TERM" = "linux" ]
        while true
            read gui_toggle -P "GUI? [Y/n] "
            if [ "$gui_toggle" = "y" -o "$gui_toggle" = "Y" -o "$gui_toggle" = "yes" -o "$gui_toggle" = "YES" -o "$gui_toggle" = "" ]
                set gui_toggle "true"
                break
            else
                set gui_toggle "false"
                break
            end
        end
        if $gui_toggle
            while true
                read xfce -P "Sway(default) or xfce? "
                if [ "$xfce" = "xfce" -o "$xfce" = "XFCE" ]
                    set XFCE "true"
                    break
                else if [ "$xfce" = "" -o "$xfce" = "sway" ]
                    set XFCE "false"
                    break
                end
            end
            if $XFCE
                #while true
                #    read egpu_toggle -P "Set eGPU primary or off(default)? "
                #    if [ "$egpu_toggle" = "primary" ]
                #        if lsmod|grep -q nouveau
                #            echo "Please reboot. The nouveau module cannot be removed."
                #            exit 1
                #        end
                #        if cat /etc/X11/xorg.conf.d/20-intel.conf|grep -qv "^#"
                #            # a script I wrote to enable/disable my eGPU. it should be updated.
                #            sudo egpu primary
                #        end
                #        break
                #    else if [ "$egpu_toggle" = "off" -o "$egpu_toggle" = "" ]
                #        if cat /etc/X11/xorg.conf.d/20-intel.conf|grep -q "^#"
                #            sudo egpu off
                #        end
                #        break
                #    end
                #end
                $HOME/.bin/gui xfce
            else
                if lsmod|grep -q nvidia
                    echo "Removing NVIDIA drivers"
                    sudo rmmod nvidia_drm
                    sleep 0.5
                    sudo rmmod nvidia_modeset
                    sleep 0.5
                    sudo rmmod nvidia_uvm
                    sleep 0.5
                    sudo rmmod nvidia
                    sleep 0.5
                    if lsmod|grep -qv "nouveau"
                        sleep 1
                        echo "Inserting nouveau driver"
                        sudo modprobe nouveau
                        sleep 1
                    end
                end
                $HOME/.bin/gui sway
            end
        end
    else
        if [ "$CACHED" = "true" ]
            echo "Cached project `$CACHED_DIR`"
        else
            # credit to https://stackoverflow.com/questions/1538676/uppercasing-first-letter-of-words-using-sed
            set NAME (echo "$USER"|sed -e "s/\b\(.\)/\u\1/g")
            echo "Welcome, $NAME."
        end
        echo -e "│\n│"
    end
end

# Things
export PATH="$HOME/.bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/bin:/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/node_modules/.bin"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export CARGO_HOME="$HOME"
export RUST_SRC_PATH=(rustc --print sysroot)"/lib/rustlib/src/rust/src"
export CC="/usr/bin/gcc"
export LD="/usr/bin/ld"
export CXX="/usr/bin/g++"
export DENO_INSTALL="$HOME/.deno"
export VISUAL=nvim
export EDITOR=nvim
export TZ="America/New_York"
export PICO_SDK_PATH="$HOME/github/pico-sdk"
if lsmod|grep -q "nvidia"
    export VK_ICD_FILENAMES="/usr/share/vulkan/icd.d/nvidia_icd.json"
else
    export VK_ICD_FILENAMES="/usr/share/vulkan/icd.d/intel_icd.x86_64.json"
end
export WIFI_INTERFACE="wlan0"

# aliases
alias calc="/bin/calc -d"
alias ..="cd ../"
alias l="ls -ahCFk"
alias ll="l -l"
alias py3=python3
alias py=python
alias vim="nvim -p"
alias vi="nvim -p"
alias v="nvim -p"
alias run=./run
alias runr="./run --release"
alias build=./build
alias buildr="./build --release"
alias debug="./debug"
alias release=./release
alias clean="cargo clean"
alias test_wifi="ping google.com -c1 -w2"
alias cargo_build="echo -e \"#!/bin/fish\ncargo build \\\$argv\">build && chmod +x build"
alias cargo_run="echo -e \"#!/bin/fish\ncargo run \\\$argv\">run && chmod +x run"
alias commit="git commit -S"
alias ":desktop"="cd $HOME/Desktop"
alias "project"="source $HOME/.bin/project $argv[1]"
# alias  school="source $HOME/.bin/school $argv[1]"
alias rss="canto-curses"
alias ":projects"="cd $HOME/projects"
alias init_c="echo -e \"#include <stdio.h>\n\n\nint main() {\n    return 0;\n}\""
alias init_cpp="echo -e \"#include <iostream>\n\n\nusing std::cout;\nusing std::endl;\nusing std::cin;\n\n\nint main() {\n    return 0;\n}\""
alias butler="$HOME/.config/itch/apps/butler/butler"
alias bat="bat --paging=never"
alias build_less="./build 2>&1|less"
alias run_less="./run 2>&1|less"
alias test_less="./test 2>&1|less"
# Save me SO MUCH trouble
alias rm=trash
alias kill_job="kill (jobs -p %1)"


function school
    set DEFAULT ""
    function goTo
        if [ -d "$HOME/school/$argv[1]/$argv[2]" ]
            cd $HOME/school/$argv[1]/$argv[2]
        else
            echo "\"$HOME/school/$argv[1]/$argv[2]\" is not a directory"
        end
    end
    if [ "$argv[1]" = "list" ]
        /bin/ls -1 $HOME/school/*
    else if [ "$argv[1]" = "home" -o "$argv[1]" = "all" ]
        cd $HOME/school/
    else if [ "$argv[1]" = "college" ]
        goTo "$argv[1]" "$argv[2]" ]
    else if [ "$argv[1]" = "12" ]
        goTo "$argv[1]" "$argv[2]" ]
    else if [ "$argv[1]" = "11" ]
        goTo "$argv[1]" "$argv[2]"
    else if [ "$argv[1]" = "10" ]
        goTo "$argv[1]" "$argv[2]"
    else if [ "$argv[1]" = "open" ]
        if [ "$argv[2]" = "" ]
            echo "Nothing to open. Please provide the file to open in the second argument."
            return 1
        end
        vivaldi-stable $HOME/school/$DEFAULT/$argv[2]
    else
        if [ "$argv[1]" = "" ]
            cd $HOME/school/$DEFAULT
        else
            if [ -d "$HOME/school/$DEFAULT/$argv[1]" ]
                cd $HOME/school/$DEFAULT/$argv[1]
            else
                echo "\"$HOME/school/$DEFAULT/$argv[1]\" is not a directory"
            end
        end
    end
end
function wifi
    # Set the default if it does not exist
    if [ "$WIFI_INTERFACE" = "" ]
        export WIFI_INTERFACE="wlan0"
    end
    # Handle arguments
    if [ "$argv[1]" = "scan" ]
        iwctl station $WIFI_INTERFACE scan
        iwctl station $WIFI_INTERFACE get-networks
    else if [ "$argv[1]" = "connect" ]
        if [ "$argv[2]" = "" ]
            echo "Please provide a network name to connect to"
            return 1
        end
        if iwctl station $WIFI_INTERFACE connect $argv[2]
            wifi wait_ip
        end
    else if [ "$argv[1]" = "disconnect" ]
        iwctl station $WIFI_INTERFACE disconnect
    else if [ "$argv[1]" = "status" ]
        iwctl station $WIFI_INTERFACE show
    else if [ "$argv[1]" = "wait_ip" ]
        set COUNT "0"
        set REVERSE "false"
        while true
            echo -n "Waiting for IP... "
            if $REVERSE
                if [ "$COUNT" = "0" ]
                    set REVERSE "false"
                    set COUNT "1"
                    echo -en "[*  ]\r"
                else if [ "$COUNT" = "1" ]
                    set COUNT "0"
                    echo -en "[ * ]\r"
                else if [ "$COUNT" = "2" ]
                    set COUNT "1"
                    echo -en "[  *]\r"
                end
            else
                if [ "$COUNT" = "0" ]
                    set COUNT "1"
                    echo -en "[*  ]\r"
                else if [ "$COUNT" = "1" ]
                    set COUNT "2"
                    echo -en "[ * ]\r"
                else if [ "$COUNT" = "2" ]
                    set REVERSE "true"
                    set COUNT "1"
                    echo -en "[  *]\r"
                end
            end
            if iwctl station $WIFI_INTERFACE show|grep "IPv4 address" -q
                break
            end
            sleep 1
        end
    else
        echo "Help:"
        echo "  subcommands:"
        echo "    scan: scans for nearby wifi networks and displays the SSID"
        echo "    connect SSID: connects to the network SSID"
        echo "    disconnect: disconnects from the current network"
        echo "    status: shows the currently connected network (if there is one)"
        echo "    wait_ip: waits for an IPv4 to be assigned"
    end
end
set WIFI_COMMANDS "scan connect disconnect status"
complete -c wifi -f
complete -c wifi -n "not __fish_seen_subcommand_from $WIFI_COMMANDS" -a "$WIFI_COMMANDS"
function png2pdf
    if [ (count $argv) = "0" ]
        echo "Please provide a file name and PNG filename(s) to convert"
        return 1
    end
    if [ (count $argv) = "1" ]
        echo "Please provide PNG filename(s) to convert"
        return 1
    end
    set CONTENTS ""
    for file in $argv[2..]
        set CONTENTS (echo "$CONTENTS![]($file)")
    end
    echo "$CONTENTS"|pandoc -o $argv[1]
end
function screenshot
    if argparse 'f/fullscreen' -- $argv
        set SLURP_ARGS ""
        if [ ! "$_flag_f" = "" ]
            set SLURP_ARGS "-o"
        end
        set SLURP_OUT (slurp $SLURP_ARGS)
        if [ "$pipestatus" = "0" ]
            if [ "$argv[1]" = "" ]
                grim -g "$SLURP_OUT" screenshot.png
            else
                grim -g "$SLURP_OUT" "$argv[1]"
            end
        else
            return 1
        end
    end
end


# ESP32 development stuff
export PATH="$HOME/.espressif/tools/xtensa-esp32-elf-clang/esp-13.0.0-20211203-x86_64-unknown-linux-gnu/bin/:$HOME/.platformio/penv/bin/platformio:$PATH"
function esp_source
    export LIBCLANG_PATH="$HOME/.espressif/tools/xtensa-esp32-elf-clang/esp-13.0.0-20211203-x86_64-unknown-linux-gnu/lib/"
    export PIP_USER=no
    export IDF_PATH="$HOME/github/esp-idf"
    source $HOME/github/esp-idf/export.fish
end
