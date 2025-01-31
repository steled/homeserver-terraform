s/\(= "\).*/\1<REDACTED>"/
s/\(  "\).*/\1(\\"<REDACTED>\\" \\"<REDACTED>\\")",/

/-----BEGIN OPENSSH PRIVATE KEY-----/{
  p
    :a
    N
    /-----END OPENSSH PRIVATE KEY-----/!ba
    s/.*\n/      <REDACTED>\n/
}
