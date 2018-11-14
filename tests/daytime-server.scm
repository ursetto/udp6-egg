;; daytime-server.scm
;; Listens on port 1313 on both IPv4 and IPv6 (typically)
;; for any UDP datagram, and responds with the current time.

(require-extension udp6)
(cond-expand
  (chicken-5 
    (import (chicken format) (chicken time posix)))
  (else (use posix)))

(define s (udp-open-socket 'inet6))
(udp-bind! s "::" 1313)
(let loop ()
  (receive (len str host port) (udp-recvfrom s 1024)
      (print "received " len " bytes from [" host "]:" port " : " (sprintf "~S" str))
      (udp-sendto s host port (string-append (seconds->string) "\n"))
      (loop)))
(udp-close-socket s)
