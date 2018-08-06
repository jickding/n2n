.EXPORT_ALL_VARIABLES:


#ROOT_DIRECTORY = /usr/bin
DIRS = n2n_v1  n2n_v2
DESTDIR=$(shell echo "`pwd`/n2n")


all:
	for i in $(DIRS) ; do(\
		if [ $$i == "n2n_v2" ] ;then \
			cd $$i; cmake ./;cd -;\
		fi;\
	       	make -C $$i $@;\
	       	make install -C $$i $@ ;\
	); done

romfs:
	$(ROMFSINST) $(DESTDIR) /

clean:
	rm -rf $(DESTDIR)
