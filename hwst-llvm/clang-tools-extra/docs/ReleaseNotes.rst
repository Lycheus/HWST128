===================================================
Extra Clang Tools 8.0.0 (In-Progress) Release Notes
===================================================

.. contents::
   :local:
   :depth: 3

Written by the `LLVM Team <https://llvm.org/>`_

.. warning::

   These are in-progress notes for the upcoming Extra Clang Tools 8 release.
   Release notes for previous releases can be found on
   `the Download Page <https://releases.llvm.org/download.html>`_.

Introduction
============

This document contains the release notes for the Extra Clang Tools, part of the
Clang release 8.0.0. Here we describe the status of the Extra Clang Tools in
some detail, including major improvements from the previous release and new
feature work. All LLVM releases may be downloaded from the `LLVM releases web
site <https://llvm.org/releases/>`_.

For more information about Clang or LLVM, including information about
the latest release, please see the `Clang Web Site <https://clang.llvm.org>`_ or
the `LLVM Web Site <https://llvm.org>`_.

Note that if you are reading this file from a Subversion checkout or the
main Clang web page, this document applies to the *next* release, not
the current one. To see the release notes for a specific release, please
see the `releases page <https://llvm.org/releases/>`_.

What's New in Extra Clang Tools 8.0.0?
======================================

Some of the major new features and improvements to Extra Clang Tools are listed
here. Generic improvements to Extra Clang Tools as a whole or to its underlying
infrastructure are described first, followed by tool-specific sections.

Major New Features
------------------

...

Improvements to clang-query
---------------------------

The improvements are...

Improvements to clang-rename
----------------------------

The improvements are...

Improvements to clang-tidy
--------------------------

- New :doc:`abseil-duration-division
  <clang-tidy/checks/abseil-duration-division>` check.

  Checks for uses of ``absl::Duration`` division that is done in a
  floating-point context, and recommends the use of a function that
  returns a floating-point value.

- New :doc:`abseil-faster-strsplit-delimiter
  <clang-tidy/checks/abseil-faster-strsplit-delimiter>` check.

  Finds instances of ``absl::StrSplit()`` or ``absl::MaxSplits()`` where the
  delimiter is a single character string literal and replaces with a character.

- New :doc:`abseil-no-internal-dependencies
  <clang-tidy/checks/abseil-no-internal-dependencies>` check.

  Gives a warning if code using Abseil depends on internal details.

- New :doc:`abseil-no-namespace
  <clang-tidy/checks/abseil-no-namespace>` check.

  Ensures code does not open ``namespace absl`` as that violates Abseil's
  compatibility guidelines.

- New :doc:`abseil-redundant-strcat-calls
  <clang-tidy/checks/abseil-redundant-strcat-calls>` check.

  Suggests removal of unnecessary calls to ``absl::StrCat`` when the result is
  being passed to another ``absl::StrCat`` or ``absl::StrAppend``.

- New :doc:`abseil-str-cat-append
  <clang-tidy/checks/abseil-str-cat-append>` check.

  Flags uses of ``absl::StrCat()`` to append to a ``std::string``. Suggests
  ``absl::StrAppend()`` should be used instead.

- New :doc:`modernize-concat-nested-namespaces
  <clang-tidy/checks/modernize-concat-nested-namespaces>` check.

  Checks for uses of nested namespaces in the form of
  ``namespace a { namespace b { ... }}`` and offers change to
  syntax introduced in C++17 standard: ``namespace a::b { ... }``.
  
- New :doc:`modernize-deprecated-ios-base-aliases
  <clang-tidy/checks/modernize-deprecated-ios-base-aliases>` check.

  This check warns the uses of the deprecated member types of ``std::ios_base``
  and replaces those that have a non-deprecated equivalent.

- New :doc:`readability-magic-numbers
  <clang-tidy/checks/readability-magic-numbers>` check.

  Detects usage of magic numbers, numbers that are used as literals instead of
  introduced via constants or symbols.

Improvements to include-fixer
-----------------------------

The improvements are...

Improvements to modularize
--------------------------

The improvements are...
