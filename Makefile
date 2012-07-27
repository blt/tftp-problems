REBAR=./rebar

all: clean compile

compile:
	$(REBAR) get-deps compile

clean:
	$(REBAR) clean

.PHONY: all compile clean
