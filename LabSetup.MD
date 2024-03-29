## Create Linux VM with GPU

(*) Create a [Linux VM](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal) with [GPU in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes-gpu). For this DevMeeting we are going to use the NC-series VMs powered by the [NVIDIA Tesla K80](http://images.nvidia.com/content/pdf/kepler/Tesla-K80-BoardSpec-07317-001-v05.pdf) card. You choose the **Standard NC6 (6 vcpus, 56 GB memory)**, disk type *HDD*, *East US* and [attach](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal) an extra **data disk** to store the datasets we are going to use in the labs. Also don't forget to enable **auto-shutdown**.

(*) You can generate the SSH key using [PuTTYgen](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html). More about SSH keys to connect to Linux virtual machines in Azure [here](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows).

(*) A [template](https://github.com/marcelaldecoa/DevMeetingKeras/blob/master/DeployVM/template.json) for this VM is also available. Just update the [parameters.json](https://github.com/marcelaldecoa/DevMeetingKeras/blob/master/DeployVM/parameters.json) file with your username and SSH key. This template uses static public IP. You can change that as well.

## Connect to the VM

You can connect to the VM using [PuTTY](https://www.putty.org/).


## Configure the Data Disk

If you haven't used the Azure [template](https://github.com/marcelaldecoa/DevMeetingKeras/blob/master/DeployVM/template.json) to create the new VM, you can use the file [configuredatadisk.sh](https://github.com/marcelaldecoa/DevMeetingKeras/blob/master/configdatadisk.sh) as a reference to create the partition and mount it to the folder **/DeepLearningLab**, the folder we will be using during the labs.

## Add a SSH key to GibHub

Follow the instructions from [here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) to generate a SSH key and from [here](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/) to include it to your GitHub.

## Clone this Repository

```bash
 cd /DeepLearningLab
 sudo mkdir deep-learning-projects
 sudo chown $USER -R ./deep-learning-projects/
 cd deep-learning-projects
 git clone git@github.com:marcelaldecoa/DevMeetingKeras.git
 
 ```
## Configure NVIDIA Drivers, CUDA Toolkit, cuDNN, TensorFlow and Keras

Run the bash script [setup01.sh](https://github.com/marcelaldecoa/DevMeetingKeras/blob/master/setup01.sh).

```bash
cd /DeepLearningLab/deep-learning-projects/DevMeetingKeras/
sudo -s
bash setup01.sh
```
After reboot run the bash script [setup02.sh](https://github.com/marcelaldecoa/DevMeetingKeras/blob/master/setup02.sh).

```bash
cd /DeepLearningLab/deep-learning-projects/DevMeetingKeras/
sudo -s
bash setup02.sh
exit
```

## Testing Keras
```bash
# Testing Keras
MNIST_FILE=mnist_cnn.py
wget https://raw.githubusercontent.com/keras-team/keras/master/examples/${MNIST_FILE}
python ${MNIST_FILE}
rm -f ${MNIST_FILE}
```
