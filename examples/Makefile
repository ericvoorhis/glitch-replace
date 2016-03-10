HC := ghc
HC_OPTS := --make

MAINS := replace
OBJDIR := bin
OBJS = $(addprefix $(OBJDIR)/,$(MAINS))

$(OBJDIR)/% : %.hs
	$(HC) $(HC_OPTS) $<
	mv $(basename $<) bin/
	rm -f *.o *.hi

all : $(OBJS)

$(OBJS) : | $(OBJDIR)

%.o : %.hs
	$(HC) $(HC_OPTS) $<

$(OBJDIR) :
	mkdir bin

.PHONY : clean
clean :
	rm -rf $(OBJDIR)
