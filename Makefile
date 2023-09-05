
# conda activate dai

build = _build/html/slides

html:
	sphinx-build -M html docs/pages _build
	mkdir -p $(build)
	mkdir -p $(build)/_static
	for i in docs/slides/*.md; do \
		pandoc --standalone --section-divs --variable theme="simple" --from=markdown --variable \
			transition="linear" --variable keyboard="{37:'prev',38:'prev',39:'next',40:'next'}" \
			--variable revealjs-url=https://unpkg.com/reveal.js@3.9.2/ --to=revealjs -s -o $(build)/$$(basename -s .md $$i).html $$i ; \
	done
	cp -r docs/slides/_static/* $(build)/_static 

# sphinx-build -M revealjs -d _build/doctrees/slides docs/slides _build/html/slides

open:
	google-chrome _build/html/index.html &

clean:
	rm -rf _build
