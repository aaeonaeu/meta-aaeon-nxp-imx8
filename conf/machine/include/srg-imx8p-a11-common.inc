
require conf/machine/include/imx8mp-evk.inc


# Tell Yocto that our kernel is linux-imx
PREFERRED_PROVIDER_virtual/kernel = "linux-fslc"

# Force a specific version of linux-imx (e.g., 6.12.34 or 6.12.20)
PREFERRED_VERSION_linux-fslc = "6.12.%"


KERNEL_DEVICETREE = "freescale/srg-imx8mp.dtb"

KERNEL_DEVICETREE:append = " \
	freescale/srg-imx8mp-rpmsg.dtb \
	freescale/srg-imx8mp-ecspi-slave.dtb \
	"

KERNEL_DEVICETREE:append:use-nxp-bsp = " \
	freescale/imx8mp-ab2.dtb \
	freescale/imx8mp-evk-flexcan2.dtb \
	freescale/imx8mp-evk-inmate.dtb \
	freescale/imx8mp-evk-it6263-lvds-dual-channel.dtb \
	freescale/imx8mp-evk-jdi-wuxga-lvds-panel.dtb \
	freescale/imx8mp-evk-ndm.dtb \
	freescale/imx8mp-evk-ov2775.dtb \
	freescale/imx8mp-evk-ov2775-ov5640.dtb \
	freescale/imx8mp-evk-pcie-ep.dtb \
	freescale/imx8mp-evk-rm67191.dtb \
	freescale/imx8mp-evk-rm67199.dtb \
	freescale/imx8mp-evk-root.dtb \
	freescale/imx8mp-evk-sof-wm8960.dtb \
	freescale/imx8mp-evk-spdif-lb.dtb \
	freescale/imx8mp-evk-usdhc1-m2.dtb \
	"


# Set DDR FIRMWARE
DDR_FIRMWARE_VERSION = "202006"
DDR_FIRMWARE_NAME = " \
	lpddr4_pmu_train_1d_dmem_${DDR_FIRMWARE_VERSION}.bin \
	lpddr4_pmu_train_1d_imem_${DDR_FIRMWARE_VERSION}.bin \
	lpddr4_pmu_train_2d_dmem_${DDR_FIRMWARE_VERSION}.bin \
	lpddr4_pmu_train_2d_imem_${DDR_FIRMWARE_VERSION}.bin \
	"