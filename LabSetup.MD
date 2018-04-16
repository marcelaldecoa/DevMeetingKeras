## Create Linux VM with GPU

(*) Create a [Linux VM](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal) with [GPU in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes-gpu). For this DevMeeting we are going to use the NC-series VMs powered by the [NVIDIA Tesla K80](http://images.nvidia.com/content/pdf/kepler/Tesla-K80-BoardSpec-07317-001-v05.pdf) card. You choose the **Standard NC6 (6 vcpus, 56 GB memory)**, disk type *HDD*, *East US* and [attach](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal) an extra **data disk** to store the datasets we are going to use in the labs. Also don't forget to enable **auto-shutdown**.

(*) You can generate the SSH key using [PuTTYgen](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html). More about SSH keys to connect to Linux virtual machines in Azure [here](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows).

(*) A [template](https://github.com/marcelaldecoa/DevMeetingKeras/blob/master/DeployVM/template.json) for this VM is also available. Just update the [parameters.json](https://github.com/marcelaldecoa/DevMeetingKeras/blob/master/DeployVM/parameters.json) file with your username and SSH key. This template uses static public IP. You can change that as well.

## Connect to the VM

You can connect to the VM using [PuTTY](https://www.putty.org/).


## Configure the Data Disk

If you haven't used the Azure [template](https://github.com/marcelaldecoa/DevMeetingKeras/blob/master/DeployVM/template.json) to create the new VM, you can use the file [configuredatadisk.sh](https://github.com/marcelaldecoa/DevMeetingKeras/blob/master/configdatadisk.sh) as a reference to create the partition and mount it to the folder **/DeepLearningLab**, the folder we will be using during the labs.

## Clone this Repository

```
 cd /DeepLearningLab
 git clone https://github.com/marcelaldecoa/DevMeetingKeras.git
 
 ```
