# Copyright 2025 Variscite Ltd.
#
# SPDX-License-Identifier: BSD-3-Clause

# Variscite MII diagnostic utility

var_mii:
	$(call fbprint_b,"var_mii") && \
	$(call repo-mngr,fetch,var_mii,apps/utils) && \
	cd $(UTILSDIR)/var_mii && \
	export CC="$(CROSS_COMPILE)gcc --sysroot=$(RFSDIR)" && \
	$(MAKE) clean && \
	$(MAKE) -j$(JOBS) && \
	install -d $(DESTDIR)/usr/bin && \
	install -m 0755 var-mii $(DESTDIR)/usr/bin/var-mii && \
	$(call fbprint_d,"var_mii")
