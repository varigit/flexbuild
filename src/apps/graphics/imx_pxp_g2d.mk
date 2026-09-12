# Copyright 2023-2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause

# G2D library using i.MX PXP on imx93



imx_pxp_g2d:
	@[ $(SOCFAMILY) != IMX -o $(DISTROVARIANT) = base -o $(DISTROVARIANT) = tiny ] && exit || \
	 if [[ "$${MACHINE}" == imx8qm* || "$${MACHINE}" == imx8qxp* ]]; then exit 0; fi; \
	 $(call fbprint_b,"imx_pxp_g2d") && \
	 $(call repo-mngr,fetch,imx_pxp_g2d,apps/graphics) && \
	 if [ ! -f $(DESTDIR)/usr/include/linux/pxp_device.h ]; then \
	     bld linux-headers -r $(DISTROTYPE):$(DISTROVARIANT) -a $(DESTARCH); \
	 fi && \
	 export CC="$(CROSS_COMPILE)gcc --sysroot=$(RFSDIR)" && \
	 cd $(GRAPHICSDIR)/imx_pxp_g2d && \
	 $(MAKE) clean && \
	 $(MAKE) -j$(JOBS) PLATFORM=IMX93 INCLUDE='-I$(DESTDIR)/usr/include' DEST_DIR=$(DESTDIR) && \
	 $(MAKE) -j$(JOBS)  DEST_DIR=$(DESTDIR) install && \
	 $(call fbprint_d,"imx_pxp_g2d")
