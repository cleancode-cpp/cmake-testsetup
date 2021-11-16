#include <gtest/gtest.h>

#include "MyClass.h"

TEST(MyClass, should_be_true) {
  auto subject = MyClass{};
  EXPECT_EQ(false, subject.isAlwaysTrue()); // FIXME
}

TEST(MyClass, report_decision) {
  auto subject = MyClass{true};
  EXPECT_TRUE(subject.decide());
}
