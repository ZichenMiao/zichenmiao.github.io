build=$(basename $(notdir $(wildcard templates/*.jemdoc)))

Hbuild=$(addsuffix .html, $(build))
PHbuild=$(addprefix build/, $(Hbuild))

.PHONY : build
# jemdoc incorrectly sets file with "index" in the filename to be selected
build : $(PHbuild)
	cp static/* build/
	cp css/* build/
	sed -i 's/ class="current"//g' build/index.html;\


build/%.html : templates/%.jemdoc MENU config.conf
	@mkdir -p build
	python jemdoc.py -c config.conf -o $@ $<

.PHONY : clean
clean :
	rm -rf build/