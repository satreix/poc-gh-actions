#!/usr/bin/env python3

import unittest


class RepoTest(unittest.TestCase):
    def test_derived_files(self):
        with open('deps.txt') as f:
            manager_data = f.read().strip()
        with open('third_party/deps-derived.txt') as f:
            derived_data = f.read().strip()
        self.assertEqual(
            derived_data,
            manager_data,
            "manager and derived data are out of sync",
        )


if __name__ == "__main__":
    unittest.main()
