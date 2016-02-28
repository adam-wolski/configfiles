"""
File: SConstruct.py
Author: Adam Wolski
Email: miniupuchaty@gmail.com
Github: https://github.com/miniukof
Description: Template SConstruct file
"""

import os

P = 'program' # Main program name

# Setup scons enviroment
ENV = Environment(CC='clang',
                  CCFLAGS=['-g',
                           '-std=gnu11',
                           '-Wall',
                           '-Wextra',
                           '-Wpedantic',
                           '-Wshadow',
                           '-Wstrict-overflow',
                           '-fno-strict-aliasing',
                           # '-O2',
                          ])

# Set the include paths
ENV.Append(CPPPATH=['src', 'tests'])

# Copy build .o files in build directory.
# In paths later specify path like src is in build ex:
#   Instead of ./src/foo.c we will use ./build/foo.c
#
# Files aren't duplicated in there because of duplicate=0 but that's the path
# we need to specify in later references.
ENV.VariantDir(variant_dir='build', src_dir='src', duplicate=0)
ENV.VariantDir(variant_dir='build/tests', src_dir='tests', duplicate=0)

# Sources directory
SDIR = 'src'
# Tests directory
TESTS_DIR = 'tests'

# Create separate ENV.Object objects for all the .c files that are used in
# multiple programs.
# TODO 
# This code need to get nicer, espacially part where we replace src with '.'
COMMON_SOURCES = \
    [ENV.Object(
        os.path.join('build',
                     os.path.join(dirp, f).replace('src', '.')))
     for dirp, dirn, files in os.walk(SDIR)
     for f in files
     if f.endswith('.c') and f.find('{}.c'.format(P)) == -1]

# Main program sources
SOURCES = ['build/{}.c'.format(P)]
SOURCES += COMMON_SOURCES

# Test sources
TESTS_SOURCES = [os.path.join('build/tests', f)
                 for f in os.listdir(TESTS_DIR)
                 if f.endswith('.c')]
TESTS_SOURCES += COMMON_SOURCES

# Libraries
L = []
# Library paths
LP = ['/usr/lib', '/usr/local/lib']


# --- Building
ENV.Program('build/{}'.format(P), SOURCES, LIBS=L, LIBPATH=LP)
ENV.Program('build/tests/tests', TESTS_SOURCES, LIBS=L, LIBPATH=LP)
