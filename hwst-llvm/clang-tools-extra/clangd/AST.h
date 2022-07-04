//===--- AST.h - Utility AST functions  -------------------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Various code that examines C++ source code using AST.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_CLANG_TOOLS_EXTRA_CLANGD_AST_H_
#define LLVM_CLANG_TOOLS_EXTRA_CLANGD_AST_H_

#include "clang/AST/Decl.h"
#include "clang/Basic/SourceLocation.h"
#include "index/Index.h"

namespace clang {
class SourceManager;
class Decl;

namespace clangd {

/// Find the identifier source location of the given D.
///
/// The returned location is usually the spelling location where the name of the
/// decl occurs in the code.
SourceLocation findNameLoc(const clang::Decl *D);

/// Returns the qualified name of ND. The scope doesn't contain unwritten scopes
/// like inline namespaces.
std::string printQualifiedName(const NamedDecl &ND);

/// Gets the symbol ID for a declaration, if possible.
llvm::Optional<SymbolID> getSymbolID(const Decl *D);

/// Gets the symbol ID for a macro, if possible.
/// Currently, this is an encoded USR of the macro, which incorporates macro
/// locations (e.g. file name, offset in file).
/// FIXME: the USR semantics might not be stable enough as the ID for index
/// macro (e.g. a change in definition offset can result in a different USR). We
/// could change these semantics in the future by reimplementing this funcure
/// (e.g. avoid USR for macros).
llvm::Optional<SymbolID> getSymbolID(const IdentifierInfo &II,
                                     const MacroInfo *MI,
                                     const SourceManager &SM);

} // namespace clangd
} // namespace clang

#endif // LLVM_CLANG_TOOLS_EXTRA_CLANGD_AST_H_
