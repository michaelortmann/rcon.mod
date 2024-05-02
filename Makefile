# Makefile for src/mod/rcon.mod/

srcdir = .


doofus:
	@echo ""
	@echo "Let's try this from the right directory..."
	@echo ""
	@cd ../../../ && make

static: ../rcon.o

modules: ../../../rcon.$(MOD_EXT)

../rcon.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -DMAKING_MODS -c $(srcdir)/rcon.c
	@rm -f ../rcon.o
	mv rcon.o ../

../../../rcon.$(MOD_EXT): ../rcon.o
	$(LD) -o ../../../rcon.$(MOD_EXT) ../rcon.o
	$(STRIP) ../../../rcon.$(MOD_EXT)

depend:
	$(CC) $(CFLAGS) $(CPPFLAGS) -MM $(srcdir)/rcon.c > .depend

clean:
	@rm -f .depend *.o *.$(MOD_EXT) *~
distclean: clean

#safety hash
rcon.o: .././rcon.mod/rcon.c .././rcon.mod/rcon.h \
 .././rcon.mod/../module.h ../../../src/main.h ../../../config.h \
 ../../../eggint.h ../../../lush.h ../../../src/lang.h \
 ../../../src/eggdrop.h ../../../src/compat/in6.h ../../../src/flags.h \
 ../../../src/cmdt.h ../../../src/tclegg.h ../../../src/tclhash.h \
 ../../../src/chan.h ../../../src/users.h ../../../src/compat/compat.h \
 ../../../src/compat/snprintf.h ../../../src/compat/strlcpy.h \
 .././rcon.mod/../modvals.h ../../../src/tandem.h
