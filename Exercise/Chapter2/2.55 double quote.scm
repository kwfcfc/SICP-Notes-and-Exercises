;; The ' symbol is actually an abbreviation of (quote <?>)
(car ''abracadabra)
;; In list representation, it is
(car (quote (quote abracadabra)))
;; this first quote procedure will return its argument as its
;; value, which is (quote abracadabra), a list structure.
;; Therefore, (car (quote abracadabra)) returns quote.

