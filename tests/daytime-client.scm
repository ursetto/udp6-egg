(require-extension udp6)
(cond-expand
  (chicken-5 (import (chicken format)))
  (else))



(define port 1313)
(define family 'inet6)
(define host "localhost")
(define s (udp-open-socket family))
(udp-connect! s host port)  ; daytime service
(udp-send s "\n")
(receive (n data host port) (udp-recvfrom s 64)
  (print n " bytes from " host ":" port ": " (sprintf "~S" data)))
(udp-close-socket s)
