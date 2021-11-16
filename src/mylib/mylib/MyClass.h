#pragma once
#include <optional>

class MyClass {
  using OptDecision = std::optional<bool>;
  bool m_decision{};

public:
  MyClass() = default;
  MyClass(bool decision);

  bool isAlwaysTrue();

  auto decide() const -> OptDecision;
};
