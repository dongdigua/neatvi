# https://github.com/NixOS/nixpkgs/blob/nixos-22.11/pkgs/development/tools/cosmoc/default.nix
CC = cosmocc
CFLAGS =
LDFLAGS =

OBJS = vi.o ex.o lbuf.o mot.o sbuf.o ren.o dir.o syn.o reg.o led.o \
	uc.o term.o rset.o rstr.o regex.o cmd.o conf.o

all: vi.com

conf.o: conf.h

%.o: %.c
	$(CC) -c $(CFLAGS) $<
vi: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)
vi.com: vi
	objcopy -S -O binary vi vi.com
clean:
	rm -f *.o vi
