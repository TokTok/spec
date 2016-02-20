#!/bin/sh

# Generates `spec.html`.
# `rust.css` must be included alongside with `.html` file in order to work.

rustdoc --markdown-css rust.css --output ./ spec.md
