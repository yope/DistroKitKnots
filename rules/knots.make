# -*-makefile-*-
#
# Copyright (C) 2025 by David Jander <djander@gmail.com>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_KNOTS) += knots

#
# Paths and names
#
KNOTS_VERSION	:= v28.1.knots20250305
KNOTS_MD5	:= 0b1ffa0330f10ee6012d9a8fa069b201
KNOTS		:= knots-$(KNOTS_VERSION)
KNOTS_SUFFIX	:= tar.gz
KNOTS_URL	:= https://github.com/bitcoinknots/bitcoin/archive/refs/tags/$(KNOTS_VERSION).$(KNOTS_SUFFIX)
KNOTS_SOURCE	:= $(SRCDIR)/$(KNOTS).$(KNOTS_SUFFIX)
KNOTS_DIR	:= $(BUILDDIR)/$(KNOTS)
KNOTS_LICENSE	:= MIT

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#KNOTS_CONF_ENV	:= $(CROSS_ENV)

#
# autoconf
#
KNOTS_CONF_TOOL	:= autoconf
#KNOTS_CONF_OPT	:= $(CROSS_AUTOCONF_USR)

#$(STATEDIR)/knots.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, KNOTS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/knots.compile:
#	@$(call targetinfo)
#	@$(call world/compile, KNOTS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/knots.install:
#	@$(call targetinfo)
#	@$(call world/install, KNOTS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/knots.targetinstall:
	@$(call targetinfo)

	@$(call install_init, knots)
	@$(call install_fixup, knots, PRIORITY, optional)
	@$(call install_fixup, knots, SECTION, base)
	@$(call install_fixup, knots, AUTHOR, "David Jander <djander@gmail.com>")
	@$(call install_fixup, knots, DESCRIPTION, "TODO knots")

#	# This is an example only. Adapt it to your requirements. Read the
#	# documentation's section "Make it Work" in chapter "Adding new Packages"
#	# how to prepare this content or/and read chapter
#	# "Rule File Macro Reference" to get an idea of the available macros
#	# you can use here and how to use them.

#	# install library (note: may fail, if there is no library)
#	@$(call install_lib, knots, 0, 0, 0644, libknots)

#	# install binary (note: may fail, if there is no binary)
	@$(call install_tree, knots, 0, 0, -, /usr)

	@$(call install_finish, knots)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/knots.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, KNOTS)

# vim: syntax=make
