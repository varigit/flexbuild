# Copyright 2025 Variscite Ltd.
#
# SPDX-License-Identifier: BSD-3-Clause

# Broadcom patch download utility

brcm_patchram_plus:
	$(call fbprint_b,"brcm_patchram_plus") && \
	$(call repo-mngr,fetch,brcm_patchram_plus,apps/utils) && \
	cd $(UTILSDIR)/brcm_patchram_plus && \
	export CC="$(CROSS_COMPILE)gcc --sysroot=$(RFSDIR)" && \
	$(MAKE) clean && \
	$(MAKE) -j$(JOBS) && \
	$(MAKE) install DESTDIR=$(DESTDIR) && \
	$(call fbprint_d,"brcm_patchram_plus")
