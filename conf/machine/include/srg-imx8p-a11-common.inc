
require conf/machine/include/imx8mp-evk.inc


# Tell Yocto that our kernel is linux-imx
PREFERRED_PROVIDER_virtual/kernel = "linux-imx"

# Force a specific version of linux-imx 
PREFERRED_VERSION_linux-imx = "6.6.%"

KERNEL_DEVICETREE_BASENAME = "imx8mp-evk"

KERNEL_DEVICETREE = "freescale/srg-imx8p-a11-04.dtb"

KERNEL_DEVICETREE:append = " \
	freescale/srg-imx8p-a11-04-rpmsg.dtb \
	freescale/srg-imx8p-a11-04-ecspi-slave.dtb \
	"

KERNEL_DEVICETREE:append:use-nxp-bsp = " \
	freescale/imx8mp-ab2.dtb \
	freescale/imx8mp-evk-basler.dtb \
	freescale/imx8mp-evk-dual-basler.dtb \
	freescale/imx8mp-evk-dual-ov2775.dtb \
	freescale/imx8mp-evk-flexcan2.dtb \
	freescale/imx8mp-evk-hifiberry-dacplus.dtb \
	freescale/imx8mp-evk-inmate.dtb \
	freescale/imx8mp-evk-iqaudio-dacplus.dtb \
	freescale/imx8mp-evk-iqaudio-dacpro.dtb \
	freescale/imx8mp-evk-ndm.dtb \
	freescale/imx8mp-evk-pcie-ep.dtb \
	freescale/imx8mp-evk-root.dtb \
	freescale/imx8mp-evk-sof-wm8960.dtb \
	freescale/imx8mp-evk-spdif-lb.dtb \
	freescale/imx8mp-evk-usdhc1-m2.dtb \
	"

UBOOT_CONFIG_BASENAME = "srg-imx8p-a11-04"
UBOOT_CONFIG = "sd"
UBOOT_CONFIG[fspi] = "${UBOOT_CONFIG_BASENAME}_defconfig"
UBOOT_CONFIG[sd] = "${UBOOT_CONFIG_BASENAME}_defconfig"
UBOOT_CONFIG[ndm]  = "${UBOOT_CONFIG_BASENAME}_ndm_defconfig"
UBOOT_DTB_NAME = "${UBOOT_CONFIG_BASENAME}.dtb"

# Set DDR FIRMWARE
DDR_FIRMWARE_VERSION = "202006"
DDR_FIRMWARE_NAME = " \
	lpddr4_pmu_train_1d_dmem_${DDR_FIRMWARE_VERSION}.bin \
	lpddr4_pmu_train_1d_imem_${DDR_FIRMWARE_VERSION}.bin \
	lpddr4_pmu_train_2d_dmem_${DDR_FIRMWARE_VERSION}.bin \
	lpddr4_pmu_train_2d_imem_${DDR_FIRMWARE_VERSION}.bin \
	"

IMXBOOT_TARGETS_BASENAME = "flash_evk"

# Mainline BSP doesn't support LPDDR4 so it must be set to nxp.
# Also this machine isn't supported by u-boot-fslc but imx8mn-evk.inc already
# set the bootloader to u-boot-imx instead when NXP BSP is used.
IMX_DEFAULT_BSP = "nxp"

SERIAL_CONSOLES = "115200;ttymxc1"

UBOOT_DTB_LOADADDRESS = "0x50480000"
UBOOT_RD_LOADADDRESS = "0x60000000"
