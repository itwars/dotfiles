#!/usr/bin/env bash


if [[ $(colima status 2>&1 | grep "is running") ]]; then echo ; else echo ; fi;
