## Create Linux VM with GPU

(*) Create a [Linux VM](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal) with [GPU in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes-gpu). For this DevMeeting we are going to use the NC-series VMs powered by the [NVIDIA Tesla K80](http://images.nvidia.com/content/pdf/kepler/Tesla-K80-BoardSpec-07317-001-v05.pdf) card. You choose the **Standard NC6 (6 vcpus, 56 GB memory)** and [attach](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal) an extra **data disk** to store the datasets we are going to use in the labs.

## Download and Install Anaconda for Python 3.6
