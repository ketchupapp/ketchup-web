#!/bin/bash

set +vx

bundle update rails

echo
echo "Note that the conflict doesn't make sense... railties is already unlocked because rails depends on it, and the version requirement allows 5.2.0.rc2. Now let's try unlocking everything that depends on railties:"
echo

bundle update rails rails devise rspec-rails webpacker web-console lograge administrate tiddle

echo
echo "This time, the conflicting requirement is completely open and doesn't seem like a conflict at all. Why isn't this allowed?"
echo
