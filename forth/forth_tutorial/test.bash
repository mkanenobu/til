#!/bin/bash

echo "$(basename $(find -name "*.html" | sed -n 1p))"
