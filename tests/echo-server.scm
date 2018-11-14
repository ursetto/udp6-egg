(require-extension udp6)
(cond-expand
  (chicken-5 (import (chicken format)))
  (else))

(define s (udp-open-socket 'inet6))
(udp-bind! s "::" 1337)
(let loop ()
  (receive (len str host port) (udp-recvfrom s 1024)
      (print "received " len " bytes from [" host "]:" port " : " (sprintf "~S" str)))
      (loop))
(udp-close-socket s)
