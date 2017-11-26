# Makefile
# My Editor
#
# Copyrights (c) Hiroki Tachiyama
# Create 2017/7/21 22:55
#


# COMPILER = g++
# CFLAGS   = -g -Wall -O2
# LDFLAGS  =
# LIBS     =
# INCLUDE  = -I../include
# TARGET   = ../bin/example
# OBJDIR   = ./obj
# SOURCES  = $(wildcard *.cpp)
# OBJECTS  = $(addprefix $(OBJDIR)/, $(SOURCES:.cpp=.o))

#  $(TARGET): $(OBJECTS) $(LIBS)
#     $(COMPILER) -o $@ $^ $(LDFLAGS)

# $(OBJDIR)/%.o: %.cpp
#     @[ -d $(OBJDIR) ]
#     $(COMPILER) $(CFLAGS) $(INCLUDE) -o $@ -c $<

# all: clean $(TARGET)

# clean:
#     rm -f $(OBJECTS) $(TARGET)

COMPILER = g++
NAME_TARGET = me
SRC_DIR = body
INC_DIR = inc
OBJ_DIR = $(SRC_DIR)/obj
BIN_DIR = bin
TARGET = $(BIN_DIR)/$(NAME_TARGET)
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
#delete "body" by subst function
OBJECTS = $(addprefix $(OBJ_DIR), $(subst body,,$(SOURCES:.cpp=.o)))

#build options

INCLUDE_OPTION = -I$(INC_DIR) -Wall
NAME_OPTION = -o $(NAME_TARGET)
OBJECT_OPTION = -c

#PROGNAME: me
#	@ cd ;
#	@ $(shell mv ./*.o $(OBJ_DIR))
$(TARGET): $(OBJECTS)
	@echo $(CURDIR) $(OBJECTS)
	$(COMPILER) $(NAME) $(INCLUDE) $(OBJECTS)

obj: $(OBJECTS)
	@[ -d $(O)]
	$(COMPILER) $(OBJECT_OPTION)


#$(OBJ_DIR)/%.o: %.cpp
#	@[ -d $(OBJ_DIR) ]
#	$(CXX) $(OPTIONS) -o $@ -c $<

# $< で依存ファイルの1つ目を示す
#my_editor.o: my_editor.cpp my_editor.h
#	$(CXX) -c $(OPTIONS) $<

#main_loop.o: main_loop.cpp
#	$(CXX) -c $(OPTIONS) $<

#buffer.o: buffer.cpp buffer.h
#	$(CXX) -c $(OPTIONS) $<

printVars:
	@echo $(COMPILER)
	@echo $(NAME_TARGET)
	@echo $(SRC_DIR)
	@echo $(INC_DIR)
	@echo $(OBJ_DIR)
	@echo $(BIN_DIR)
	@echo $(TARGET)
	@echo $(SOURCES)
	@echo $(OBJECTS)
	@echo $(INCLUDE)
	@echo $(NAME)


clean:
	rm -f me
	rm -f $(OBJ_DIR)/*.o
