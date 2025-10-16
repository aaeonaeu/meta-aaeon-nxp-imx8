# SPDX-License-Identifier: GPL-2.0+
#
# (C) Copyright 2006
# Wolfgang Denk, DENX Software Engineering, wd@denx.de.

MINIMAL=

ifdef CONFIG_SPL_BUILD
ifndef CONFIG_TPL_BUILD
ifdef CONFIG_SPL_INIT_MINIMAL
MINIMAL=y
endif
endif
endif

ifdef MINIMAL
# necessary to create built-in.o
obj- := __dummy__.o
else
# include i2c_common.o once if either VID or FSL_USE_PCA9547_MUX
I2C_COMMON=

ifneq (,$(filter $(SOC), mx6 mx7 mx7ulp imx8 imx8m imx8ulp imx9))
obj-y				+= mmc.o
endif

ifndef CONFIG_SPL_BUILD
obj-$(CONFIG_USB_TCPC) += tcpc.o
endif

endif
