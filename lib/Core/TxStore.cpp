//===-- TxStore.cpp - A view of program memory ------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementations of the shadow memory to support the
/// dependency computation of memory locations and the generation of
/// interpolants.
///
//===----------------------------------------------------------------------===//

#include "TxStore.h"

#include "klee/CommandLine.h"
#include "klee/util/TxPrintUtil.h"

using namespace klee;

namespace klee {

void TxStore::MiddleStateStore::print(llvm::raw_ostream &stream,
                                      const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);
  std::string tabsNextNext = appendTab(tabsNext);

  allocInfo->print(stream, prefix);
  stream << ":\n";
  if (concretelyAddressedStore.empty()) {
    stream << prefix << "concretely-addressed store = []\n";
  } else {
    stream << prefix << "concretely-addressed store = [\n";
    for (LowerStateStore::const_iterator
             lowerIs = concretelyAddressedStore.begin(),
             lowerIe = concretelyAddressedStore.end(), lowerIt = lowerIs;
         lowerIt != lowerIe; ++lowerIt) {
      if (lowerIt != lowerIs)
        stream << tabsNext << "------------------------------------------\n";
      stream << tabsNext << "address:\n";
      lowerIt->second->getAddress()->print(stream, tabsNextNext);
      stream << "\n";
      stream << tabsNext << "content:\n";
      lowerIt->second->getContent()->print(stream, tabsNextNext);
      stream << "\n";
    }
    stream << prefix << "]\n";
  }

  if (symbolicallyAddressedStore.empty()) {
    stream << prefix << "symbolically-addressed store = []";
  } else {
    stream << prefix << "symbolically-addressed store = [\n";
    for (LowerStateStore::const_iterator
             lowerIs = symbolicallyAddressedStore.begin(),
             lowerIe = symbolicallyAddressedStore.end(), lowerIt = lowerIs;
         lowerIt != lowerIe; ++lowerIt) {
      if (lowerIt != lowerIs)
        stream << tabsNext << "------------------------------------------\n";
      stream << tabsNext << "address:\n";
      lowerIt->second->getAddress()->print(stream, tabsNextNext);
      stream << "\n";
      stream << tabsNext << "content:\n";
      lowerIt->second->getContent()->print(stream, tabsNextNext);
      stream << "\n";
    }
    stream << prefix << "]";
  }
}

/**/

ref<TxStoreEntry> TxStore::find(ref<TxStateAddress> loc) const {
  TopStateStore::const_iterator storeIter = store.find(loc->getContext());
  if (storeIter != store.end()) {
    return storeIter->second->find(loc);
  }

  ref<TxStoreEntry> nullEntry;
  return nullEntry;
}

void TxStore::getStoredExpressions(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TopInterpolantStore &_concretelyAddressedStore,
    TopInterpolantStore &_symbolicallyAddressedStore) {
  getConcreteStore(callHistory, store, replacements, coreOnly,
                   _concretelyAddressedStore);
  getSymbolicStore(callHistory, store, replacements, coreOnly,
                   _symbolicallyAddressedStore);
}

void
TxStore::getConcreteStore(const std::vector<llvm::Instruction *> &callHistory,
                          const TopStateStore &store,
                          std::set<const Array *> &replacements, bool coreOnly,
                          TopInterpolantStore &concreteStore) {
  for (TopStateStore::const_iterator it = store.begin(), ie = store.end();
       it != ie; ++it) {
    if (!it->first->isPrefixOf(callHistory))
      continue;

    LowerInterpolantStore &map = concreteStore[it->first->getValue()];

    ref<MiddleStateStore> middleStore = it->second;

    for (LowerStateStore::const_iterator it1 = middleStore->concreteBegin(),
                                         ie1 = middleStore->concreteEnd();
         it1 != ie1; ++it1) {
      if (!coreOnly) {
        map[it1->first] = it1->second->getContent()->getInterpolantStyleValue();
      } else if (it1->second->getContent()->isCore()) {
        // An address is in the core if it stores a value that is in the core
#ifdef ENABLE_Z3
        if (!NoExistential) {
          map[it1->first] =
              it1->second->getContent()->getInterpolantStyleValue(replacements);
        } else {
          map[it1->first] =
              it1->second->getContent()->getInterpolantStyleValue();
        }
#else
        map[it1->first] =
            it1->second->getContent()->getInterpolantStyleValue(replacements);
#endif
      }
    }
  }
}

void
TxStore::getSymbolicStore(const std::vector<llvm::Instruction *> &callHistory,
                          const TopStateStore &store,
                          std::set<const Array *> &replacements, bool coreOnly,
                          TopInterpolantStore &symbolicStore) {
  for (TopStateStore::const_iterator it = store.begin(), ie = store.end();
       it != ie; ++it) {
    if (!it->first->isPrefixOf(callHistory))
      continue;

    LowerInterpolantStore &map = symbolicStore[it->first->getValue()];

    ref<MiddleStateStore> middleStore = it->second;

    for (LowerStateStore::const_iterator it1 = middleStore->symbolicBegin(),
                                         ie1 = middleStore->symbolicEnd();
         it1 != ie1; ++it1) {
      if (!coreOnly) {
        map[it1->first] = it1->second->getContent()->getInterpolantStyleValue();
      } else if (it1->second->getContent()->isCore()) {
        // An address is in the core if it stores a value that is in the core
#ifdef ENABLE_Z3
        if (!NoExistential) {
          ref<TxVariable> address = TxStateAddress::create(
              it1->second->getAddress(), replacements)->getAsVariable();
          map[address] =
              it1->second->getContent()->getInterpolantStyleValue(replacements);
        } else {
          map[it1->first] =
              it1->second->getContent()->getInterpolantStyleValue();
        }
#else
        ref<TxVariable> address = TxStateAddress::create(
            it1->second->getAddress(), replacements)->getAsVariable();
        map[address] =
            it1->second->getContent()->getInterpolantStyleValue(replacements);
#endif
      }
    }
  }
}

void TxStore::updateStoreWithLoadedValue(ref<TxStateAddress> loc,
                                         ref<TxStateValue> address,
                                         ref<TxStateValue> value) {
  updateStore(loc, address, value);
  value->setLoadAddress(address);
}

void TxStore::updateStore(ref<TxStateAddress> loc, ref<TxStateValue> address,
                          ref<TxStateValue> value) {
  TopStateStore::iterator middleStoreIter = store.find(loc->getContext());

  if (middleStoreIter != store.end()) {
    ref<MiddleStateStore> middleStore = middleStoreIter->second;
    if (middleStore->hasAllocationInfo(loc->getAllocationInfo())) {
      middleStore->updateStore(loc, address, value);
      return;
    }

    // FIXME: Here we should save the old store
  }

  ref<MiddleStateStore> newMiddleStateStore =
      MiddleStateStore::create(loc->getAllocationInfo());
  store[loc->getContext()] = newMiddleStateStore;
  newMiddleStateStore->updateStore(loc, address, value);
}

/// \brief Print the content of the object to the LLVM error stream
void TxStore::print(llvm::raw_ostream &stream) const { this->print(stream, 0); }

void TxStore::print(llvm::raw_ostream &stream,
                    const unsigned paddingAmount) const {
  std::string tabs = makeTabs(paddingAmount);
  std::string tabsNext = appendTab(tabs);
  std::string tabsNextNext = appendTab(tabsNext);

  if (store.empty()) {
    stream << tabs << "store = []\n";
  } else {
    stream << tabs << "store = [\n";
    for (TopStateStore::const_iterator topIs = store.begin(),
                                       topIe = store.end(), topIt = topIs;
         topIt != topIe; ++topIt) {
      topIt->first->print(stream, tabsNext);
      stream << ":\n";
      topIt->second->print(stream, tabsNextNext);
    }
    stream << tabs << "]\n";
  }
}
}
