ASSET_FILENAMES := \
	ajifry.jpg \
	ama.jpg \
	anchovy.jpg \
	arowana.jpg \
	battera.jpg \
	bbass.jpg \
	chozame.jpg \
	dam.jpg \
	devon.jpg \
	donburako.jpg \
	engawa.jpg \
	fujitsubo.jpg \
	gangaze.jpg \
	hakofugu.jpg \
	hokke.jpg \
	kombu.jpg \
	manta.jpg \
	mongara.jpg \
	mozuku.jpg \
	mutsugoro.jpg \
	mystery.jpg \
	mystery_01.jpg \
	mystery_02.jpg \
	mystery_03.jpg \
	mystery_04.jpg \
	mystery_05.jpg \
	mystery_06.jpg \
	mystery_07.jpg \
	mystery_08.jpg \
	mystery_09.jpg \
	mystery_10.jpg \
	mystery_11.jpg \
	mystery_12.jpg \
	mystery_13.jpg \
	mystery_14.jpg \
	mystery_15.jpg \
	mystery_16.jpg \
	mystery_17.jpg \
	mystery_18.jpg \
	mystery_19.jpg \
	mystery_20.jpg \
	mystery_21.jpg \
	mystery_22.jpg \
	mystery_23.jpg \
	mystery_24.jpg \
	otoro.jpg \
	polaris.jpg \
	shaketoba.jpg \
	shottsuru.jpg \
	sumeshi.jpg \
	tachiuo.jpg \
	tokishirazu.jpg \
	zatou.jpg

ASSETS := \
	$(addprefix assets/daytime/,$(ASSET_FILENAMES)) \
	$(addprefix assets/daytime-blur/,$(ASSET_FILENAMES)) \
	$(addprefix assets/gray-blur/,$(ASSET_FILENAMES))

.PHONY: all php assets clean dist-clean
all: php assets

php: vendor

dist-clean: clean
	rm -rf composer.phar vendor node_modules

clean:
	rm -rf tmp $(ASSETS)

vendor: composer.lock composer.phar
	COMPOSER_ALLOW_SUPERUSER=1 ./composer.phar install --prefer-dist -vvv

composer.lock: composer.json composer.phar
	COMPOSER_ALLOW_SUPERUSER=1 ./composer.phar update --prefer-dist -vvv

composer.json: composer.json5
	json5 --space=4 --out-file=$@ $<

composer.phar:
	curl -sSL 'https://getcomposer.org/installer' | php -- --stable
	touch -r composer.json $@

assets: $(ASSETS)

assets/daytime/%.jpg: tmp/%.jpg
	convert $< -resize 320x180 -quality 95 $@

assets/daytime-blur/%.jpg: assets/daytime/%.jpg
	convert $< -blur 2x2 -quality 95 $@

assets/gray-blur/%.jpg: assets/daytime-blur/%.jpg
	convert $< -fx 'r*0.299+g*0.587+b*0.114' -colorspace Gray -quality 95 $@

tmp:
	mkdir tmp

tmp/ama.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DCOlNI4VYAANvOI.jpg:orig'

tmp/ajifry.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DXLF40vUMAEQR_C.jpg:orig'

tmp/anchovy.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/Dh5A_61V4AA9Z5n.jpg:orig'

tmp/arowana.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DPSOeyvVoAAGnWL.jpg:orig'

tmp/battera.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/en/splatoonwiki/images/f/f7/S2_Stage_The_Reef.png'
	convert $@.png -quality 95 $@

tmp/bbass.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DNEAZ9cUIAAphwV.jpg:orig'

tmp/chozame.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/en/splatoonwiki/images/6/62/S2_Stage_Sturgeon_Shipyard.png'
	convert $@.png -quality 95 $@

tmp/dam.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/splatoonwiki/images/2/29/S2_Stage_Spawning_Grounds.png'
	convert $@.png -quality 95 $@

tmp/devon.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DPOdfAvVAAArv3f.jpg:orig'

tmp/donburako.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/splatoonwiki/images/6/6c/S2_Stage_Marooner%27s_Bay.png'
	convert $@.png -quality 95 $@

tmp/engawa.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DLXOzECUEAAyMkl.jpg:orig'

tmp/fujitsubo.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/en/splatoonwiki/images/c/cd/S2_Stage_Musselforge_Fitness.png'
	convert $@.png -quality 95 $@

tmp/gangaze.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/en/splatoonwiki/images/3/31/S2_Stage_Starfish_Mainstage.png'
	convert $@.png -quality 95 $@

tmp/hakofugu.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DPNH39SVQAAIPiE.jpg:orig'

tmp/hokke.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/en/splatoonwiki/images/4/49/S2_Stage_Port_Mackerel.png'
	convert $@.png -quality 95 $@

tmp/kombu.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/en/splatoonwiki/images/e/ed/S2_Stage_Humpback_Pump_Track.png'
	convert $@.png -quality 95 $@

tmp/manta.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/en/splatoonwiki/images/7/7e/S2_Stage_Manta_Maria.png'
	convert $@.png -quality 95 $@

tmp/mongara.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DbhDqsRVAAAgk3U.jpg:orig'

tmp/mozuku.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DJo7HTzUEAESeuF.jpg:orig'

tmp/mutsugoro.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DnbO3gPVsAIExMD.jpg:orig'

tmp/mystery.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DGDTWhAUwAA4Bri.jpg:orig'

tmp/mystery_01.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9T_bOYU0AAGEQY.jpg:orig'

tmp/mystery_02.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9T_b_NVUAEXXrB.jpg:orig'

tmp/mystery_03.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9T_cpPVAAAF8qv.jpg:orig'

tmp/mystery_04.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9T_d34VUAEnFSd.jpg:orig'

tmp/mystery_05.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9T_7LAUIAEZMTw.jpg:orig'

tmp/mystery_06.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9T_7yiUIAAOShS.jpg:orig'

tmp/mystery_07.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9T_8cWUEAEn8CU.jpg:orig'

tmp/mystery_08.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9T_8_QUIAA6XT6.jpg:orig'

tmp/mystery_09.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9ZJccvVUAA0F6C.jpg:orig'

tmp/mystery_10.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9ZJdEmUwAAVQie.jpg:orig'

tmp/mystery_11.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9ZJeBNUEAM_mlN.jpg:orig'

tmp/mystery_12.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9ZJfG5U4AEOTW0.jpg:orig'

tmp/mystery_13.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9ZJz7NUIAAKC8K.jpg:orig'

tmp/mystery_14.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9ZJ0xYUEAEeoXR.jpg:orig'

tmp/mystery_15.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9ZJ1U5U8AAGR1U.jpg:orig'

tmp/mystery_16.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9ZJ13MUEAA7998.jpg:orig'

tmp/mystery_17.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9eUgGpVUAA4QFv.jpg:orig'

tmp/mystery_18.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9eUgucVUAEisau.jpg:orig'

tmp/mystery_19.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9eUhOzUEAIbGUR.jpg:orig'

tmp/mystery_20.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9eUhxXUEAE5clR.jpg:orig'

tmp/mystery_21.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9eU1X1VAAAiSAm.jpg:orig'

tmp/mystery_22.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9eU19eU0AAzfup.jpg:orig'

tmp/mystery_23.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9eU2jDUYAAvltg.jpg:orig'

tmp/mystery_24.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/D9jbz9jUEAAZRQ0.jpg:orig'

tmp/otoro.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/Dg09LC9V4AEpYc9.jpg:orig'

tmp/polaris.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DrJtQ2EVYAA_6kK.jpg:orig'

tmp/shaketoba.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/splatoonwiki/images/6/68/S2_Stage_Lost_Outpost.png'
	convert $@.png -quality 95 $@

tmp/shottsuru.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DYPMhr4UMAAkrG5.jpg:orig'

tmp/sumeshi.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DYPMwDjVQAAyI2_.jpg:orig'

tmp/tachiuo.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/en/splatoonwiki/images/3/37/S2_Stage_Moray_Towers.png'
	convert $@.png -quality 95 $@

tmp/tokishirazu.jpg: tmp
	curl -o $@.png 'https://cdn.wikimg.net/splatoonwiki/images/c/c7/S2_Stage_Salmonid_Smokeyard.png'
	convert $@.png -quality 95 $@

tmp/zatou.jpg: tmp
	curl -o $@ 'https://pbs.twimg.com/media/DPKV9mCV4AExVBF.jpg:orig'

