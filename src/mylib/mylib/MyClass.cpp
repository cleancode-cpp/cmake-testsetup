#include "MyClass.h"

MyClass::MyClass(bool decision)
    : m_decision(decision) {}

bool MyClass::isAlwaysTrue() { return true; }

auto MyClass::decide() const -> OptDecision { return m_decision; }
