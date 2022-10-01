# KoboldAI Horde Bridge

This software enables you to join your KoboldAI client to the [KoboldAI Horde](https://github.com/db0/AI-Horde) and make it into a worker.

This repository contains a little bridge script which you can run on your own machine (windows or linux). It will take care of communicating between the KoboldAI Horde and your own KAI Worker. This will allow people to use their own PCs to support the KAI horde.

**You KoboldAI instance must be using the UNITED branch!**

We provide a simple bridge preparation script for all operating systems. 

## Android/Termux

Through Termux, you can run the bridge on your phone and connect it to a remote KoboldAI instance.

* [Install Termux from F-Droid](https://f-droid.org/en/packages/com.termux/) if you haven't already
* Open termux and proceed with the "Install Bridge" section
  
## Windows

1. [Download git](https://gitforwindows.org/) and install with all the defaults. Make sure it installs Git Bash
2. [Download python](https://www.python.org/downloads/windows/) and install with all the defaults. Make sure it adds it to your PATH variables.
3. Open Git Bash and proceed with the "Install Bridge" section

## Linux

1. Ensure `git` is installed with your package manager
3. Open a terminal and proceed with the "Install Bridge" section

## Install Bridge

Run the below command

```bash
curl https://raw.githubusercontent.com/db0/KoboldAI-Horde/master/bridge_setup.sh | sh
```

Optionally you can pass command line variables to this command with your API KEY, your Worker name and your KAI Worker URL in that order. This will automatically setup your clientData.py so you don't have to manually edit after. Example:

```bash
curl https://raw.githubusercontent.com/db0/KoboldAI-Horde/master/bridge_setup.sh | sh -s - "1234567890" "The Chicken Circus" "https://your.remote.url.here"
```

This will download and prepare to run the bridge. At the end it will print out a message on how to start it.

Once the bridge is prepared for the first time, you need to do a few more steps:

* Edit the clientData.py file and add your API Key that you received from https://koboldai.net/register
* Edit the clientData.py file and add your KAI worker. If it's a local instance, leave it as it is. If it's a remote Kobold AI instance, fill in the URL and port accordingly.
* Go to your KAI with a browser and modify your KAI settings from the GUI so that the "Amount to Generate" and "Typical Sampling" are at the max values your KAI instance can handle. This doesn't mean all requests will use this amount. It just limits which requests your server will choose to fulfil.
* Finally, run the script: `python bridge.py` (or the `bridge_start.(bash|sh)` according to your OS)
   * Optionally, provide bridge arguments via command line. The args on the command line will override clientData.py vars, so you can use this to run multiple bridges from the same location. See `python bridge.py -h`

If all goes well, it will connect to your KAI worker and then will start polling the horde for incoming requests.

A worker will be considered "stale" and not shown in the general list, if it doesn't check in for at least 5 minutes. You can see still them through their individual UUID endpoint, and it will continue where it left off as soon as it checks back in to fulfil requests. In fact, it doesn't technically need to be the same worker. You can switch to a different box and long as your worker name and auth is the same, your stats will carry on. This means that you can keep plugging in different collab instances while retaining the same stats.

If you want to change the bridge settings in the future, you don't need to rerun `bridge_setup.sh` again. Instead just edit manually bridgeData.py with a text editor and then start the bridge.

You can also pass variables to the bridge without editing the settings. Use `python bridge.py -h` to see the supported options.

## Softprompts

The bridge will automatically enable or disable softprompts at the clients request, assuming they exist in your files. If you want to help more specialized requests, make sure you download and install other people's softprompts on your server so that they are available to generate for people using them.
