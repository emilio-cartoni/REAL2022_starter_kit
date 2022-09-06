![REAL2021 banner](https://raw.githubusercontent.com/wiki/emilio-cartoni/REAL2021_starter_kit/images/banner2021.gif)
Starting kit for the [REAL2021 competition on Robot open-Ended Autonomous Learning](https://eval.ai/web/challenges/challenge-page/1134/overview).

The REAL Competition is an online challenge, open to everyone, aimed at building a robot controller that autonomously learns to interact with an environment in an open-ended way, without being instructed specifically for a task.  

Competition has started on August 23rd and will last up to mid June 2022.  

REAL 2021 has been launched during the ICDL 2021 conference ([video](https://www.youtube.com/watch?v=w0b9Tg4nqSU)).  

## Index
* [Install the software](#install-the-software)
* [How to launch the agent](#how-to-launch-the-baseline-agent)
* [Make your own submission](#make-your-own-submission)
* [How do I...?](#how-do-i)
* [Support](#support)

## Install the software
Pre-requisites: [Python](https://www.python.org/), [Git](https://git-scm.com/), [Conda (Anaconda or Miniconda)](https://www.anaconda.com/products/individual) and [Docker](https://www.docker.com/)   
All software has been tested on Ubuntu 18.04 and 20.04.  

1. Clone this repository:  
```bash
git clone https://github.com/emilio-cartoni/REAL2021_starter_kit.git  
cd REAL2021_starter_kit
```

2. Create a conda environment named "real_robots" from the provided `environment.yml`  
```
conda env create -f environment.yml
```
This could last a while as many libraries that are needed by the baseline will be installed, including Tensorflow.  
(It is possible to reduce the libraries in the environment if you do not want to run the baseline).  

## How to launch the baseline agent
1. Activate the real_robots conda environment  
```
conda activate real_robots
```
2. Launch the local evaluation:  
```
python local_evaluation.py
```

The default values will only launch a short evaluation, edit `local_evaluation.py` to launch full evaluations and customize the options.

## Make your own submission
To make submissions to the challenge, it is necessary to create and submit a docker container, which will contain all the dependencies to run your submission and the simulation.  
1. Launch  the image build to create a docker image for your submission.   
    ```
    build.sh
    ```
    (The first build may take a long time since it will have to recreate the environment inside the container - subsequent build will be faster due to docker caching mechanism)  
2. (Optional) You can launch your docker image locally, to check it is working:
    ```
    docker run -it real2021submission:latest /root/miniconda3/bin/conda run -n real_robots python docker_evaluation.py
    ```
3. Go to [EvalAI Submit page](https://eval.ai/web/challenges/challenge-page/1134/submission) and follow the instructions there to submit the image as a submission for the REAL2021 competition.  


## How do I...?
For further information, check our [Wiki](https://github.com/emilio-cartoni/REAL2021_starter_kit/wiki).  
In particular, if you want to know more about:
- the environment, see [here](https://github.com/emilio-cartoni/REAL2021_starter_kit/wiki/REAL-Environment)
- the options available for the environment and the simulation, see [here](https://github.com/emilio-cartoni/REAL2021_starter_kit/wiki/Environment-options-and-simplifications)
- how to develop your own controller and the docker image build, see [here](https://github.com/emilio-cartoni/REAL2021_starter_kit/wiki/Submissions)  
- to know more about the baseline, see [here](https://github.com/emilio-cartoni/REAL2021_starter_kit/wiki/Baseline)  

... or see the [FAQ](https://github.com/emilio-cartoni/REAL2021_starter_kit/wiki/FAQ) for common questions or errors.

## Support
Feel free to contact us for any problems or additional questions on the competition.  
You can post them as an issue [here](https://github.com/emilio-cartoni/REAL2021_starter_kit/issues) on Github, or post on [EvalAI forum](https://evalai-forum.cloudcv.org/) or, if you prefer, directly [contact the organizers via mail](mailto:emilio.cartoni@yahoo.it?subject=[REAL2021]%20Question).


**Best of Luck** :tada: :tada:
