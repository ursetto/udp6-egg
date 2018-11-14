(module udp6
  (udp-socket? udp-bound? udp-connected? udp-open-socket
   udp-open-socket*
   udp-bind! udp-connect! ;; udp-bind udp-connect
   udp-send udp-sendto
   udp-recv udp-recvfrom udp-close-socket udp-bound-port
   ;; udp-set-multicast-interface udp-join-multicast-group
   )

(import scheme)
(cond-expand
  (chicken-4
    (import (only chicken include)))
  (else (import (chicken base))))
(include "udp6.scm")

)
