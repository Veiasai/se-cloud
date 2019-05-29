#!/bin/bash

# Below is not neccessary, just for machines that are not ready for PXE boot

racadm set nic.NICConfig.1.LegacyBootProto NONE
racadm jobqueue create NIC.Integrated.1-1-1
racadm set nic.NICConfig.3.LegacyBootProto PXE
racadm jobqueue create NIC.Integrated.1-3-1