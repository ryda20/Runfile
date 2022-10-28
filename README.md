# Runfile

This repository contains the default Runfile template for getting started in your own projects.

A Runfile is a bash (or zsh etc.) script only.

You can define the `task` you want to do by write new function in the Runfile.

I use it to replace with my Makefile because i have some difficulty to write bash code in Makefile for some cases and i don't want to write bash scripts in the Makefile. It's personally :)

## Install

```sh
    bash -c "$(curl -fsSL https://gitlab.com/ryda20/runfile/-/raw/master/install.sh)"
    or
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ryda20/Runfile/master/install.sh)"
```

## Usage
### Two operation mode: NORMAL and LOOP
    You can change the mode by change RF_MODE env to `loop` or `normal`
1. The Normal mode:
    
    Working in normally way, type `run task args` then `enter` to execute command.

2. The Loop mode (default):
   
   Working in a infinite loop, you don't need to type `run task args` anymore. 
   
   Type `run` or `./Runfile` to start.

   Then, you just need to type `task args` then `enter` to run task

   ```Note: you can run any bash command, too```

### Create Runfile:
Open your directory and run `run-init` to add the default Runfile template to your project directory:

```sh
    cd my-project
    run-init
```

A Runfile will created and you just open it up, adding your tasks (bash script function).

### Example (normal mode):
To see all your define tasks, just type `run` from terminal

```sh
    $ run
    #### user fn(s) ####=================================================================================#
    #  1) help                                                                                           #
    #====================================================================================================#
    Task completed in 0m0.008s

    $ run help
    #### Usage ####======================================================================================#
    # ./Runfile <task> <args>                                                                            #
    #       or simple (by alias run=./Runfile):                                                          #
    # run <task> <args>                                                                                  #
    #====================================================================================================#

    #### runfile fn(s) ####==============================================================================#
    #  1) rf_check_update             2) rf_ex1                         3) rf_ex2                        #
    #  4) rf_log                      5) rf_log_header                  6) rf_log_title                  #
    #  7) rf_sed_padding              8) rf_sed_remove_all_occur        9) rf_sed_remove_comment_line    #
    # 10) rf_sed_remove_empty_line   11) rf_sed_replace_all_occur      12) rf_sed_replace_first_occur    #
    #====================================================================================================#

    #### user fn(s) ####=================================================================================#
    #  1) help                                                                                           #
    #====================================================================================================#
    Task completed in 0m0.027s
```

Run the Runfile functions:
```sh
    $ run rf_ex1
    #### Example ####====================================================================================#
    # Description:                                                                                       #
    #       Description about build function run build arg1 arg2 arg3                                    #
    # Params:                                                                                            #
    #       $1: param 1 detail                                                                           #
    #               2tab                                                                                 #
    #                       3tab                                                                         #
    #                               4tab                                                                 #
    #       $2: param 2 detail                                                                           #
    #       $3: param 3 detail                                                                           #
    # Note:                                                                                              #
    #       Some note about this fn                                                                      #
    #====================================================================================================#
    Task completed in 0m0.014s

    $ run rf_ex2
    #### available cmd(s) ####===========================================================================#
    #       rf_ex2 gen [, go_out_dir = pb [, js_out_dir = pb [, proto_dir = .]]]                         #
    #               => generate go/js/ts files from .proto files.                                        #
    #       rf_ex2 clear|clean [, go_dir = pb [, js_dir = pb]]                                           #
    #               => rm all .go, .js, .ts files from input directories                                 #
    #====================================================================================================#
    Task completed in 0m0.009s

    $ run rf_ex2 gen
    go_out_dir: pb, js_out_dir: pb, proto_dir: .
    Task completed in 0m0.002s

    $ run rf_ex2 gen gout jsout protodir
    go_out_dir: gout, js_out_dir: jsout, proto_dir: protodir
    Task completed in 0m0.002s
```

## Features

    all features you can write in bash shell
