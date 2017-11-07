(asdf:defsystem :homework1
	:name "Homework 1"
	:version "0.1"
	:class :package-inferred-system
	:defsystem-depends-on (:asdf-package-system)
	:depends-on (:homework1/list_sort))