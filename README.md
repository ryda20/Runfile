# Runfile

This repository contains the default Runfile template for getting started in your own projects. A Runfile is a bash (or zsh etc.) script that follows a specific format. It's called `Runfile`, sits in the root of your project and contains the tasks to build your project.

## Install

```sh
    bash -c "$(curl -fsSL https://gitlab.com/ryda20/runfile/-/raw/master/install.sh)"
```

## Usage

Open your directory and run `run-init` to add the default Runfile template to your project directory:

```sh
    cd my-project
    run-init
```

A Runfile will created and you just open it up, adding your tasks (bash script function).
To see all your define tasks, just type `run` from terminal

```sh
    $ run
    #### user fn(s) ####=================================================================================#
    #  1) build                       2) help                           3) start                         #
    #====================================================================================================#
    Task completed in 0m0.008s

    $ run help
    #### Usage ####======================================================================================#
    # ./Runfile <task> <args>                                                                            #
    #       or simple (by alias run=./Runfile):                                                          #
    # run <task> <args>                                                                                  #
    #====================================================================================================#

    #### runfile fn(s) ####==============================================================================#
    #  1) rf_check_update             2) rf_example                     3) rf_log                        #
    #  4) rf_log_header               5) rf_log_title                   6) rf_sed_padding                #
    #  7) rf_sed_remove_all_occur     8) rf_sed_remove_comment_line     9) rf_sed_remove_empty_line      #
    # 10) rf_sed_replace_all_occur   11) rf_sed_replace_first_occur                                      #
    #====================================================================================================#

    #### user fn(s) ####=================================================================================#
    #  1) build                       2) help                           3) start                         #
    #====================================================================================================#
    Task completed in 0m0.027s
```

## Features

    all features you can write in bash shell
