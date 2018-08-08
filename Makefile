.EXPORT_ALL_VARIABLES:


#ROOT_DIRECTORY = /usr/bin
DIRS = n2n_v1  n2n_v2
DESTDIR=$(shell echo "`pwd`/n2n")


all:
	for i in $(DIRS) ; do(\
		make clean -C $ii;\
		if [ $$i == "n2n_v2" ] ;then \
			cd $$i; cmake ./;cd -;\
		fi;\
	       	make -C $$i VERBOSE=1 $@;\
	       	make install -C $$i $@ ;\
	); done

romfs:
	$(ROMFSINST) $(DESTDIR) /

clean:
	rm -rf $(DESTDIR)
