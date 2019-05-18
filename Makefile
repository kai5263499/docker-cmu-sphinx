pocketsphinx:
	docker build -t pocketsphinx -f pocketsphinx/Dockerfile pocketsphinx

sphinxbase:
	docker build -t sphinxbase -f sphinxbase/Dockerfile sphinxbase

sphinx-en-models:
	docker build -t sphinx-en-models -f sphinx-en-models/Dockerfile sphinx-en-models

pocketsphinx-go:
	docker build -t pocketsphinx-go -f pocketsphinx-go/Dockerfile pocketsphinx-go

.PHONY: pocketsphinx sphinxbase sphinx-en-models pocketsphinx-go