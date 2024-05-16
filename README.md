# flutter_application_5

Je continue de le modifier. 
16/05 je n'arrive pas a recupérer les user ...
Je fais un curl pour vérifier ce que me retourne l'API

PS C:\Users\Flore> curl https://s3-5002.nuage-peda.fr/users


StatusCode        : 200
StatusDescription : OK
Content           : [{"id":1,"lastName":"string","firstName":"string","email":"user@example.com","roles":["user","admin
                    "],"createdAt":"2024-04-21T08:38:16.000Z","updatedAt":"2024-04-21T08:38:16.000Z","Messages":[{"uri"
                    :"...
RawContent        : HTTP/1.1 200 OK
                    access-control-allow-origin: *
                    Content-Length: 9460
                    Content-Type: application/json; charset=utf-8
                    Date: Thu, 16 May 2024 20:56:29 GMT
                    ETag: W/"24f4-Y4kKfquNign3YCtqyJYcbgXD5BE"
                    S...
Forms             : {}
Headers           : {[access-control-allow-origin, *], [Content-Length, 9460], [Content-Type, application/json;
                    charset=utf-8], [Date, Thu, 16 May 2024 20:56:29 GMT]...}
Images            : {}
InputFields       : {}
Links             : {}
ParsedHtml        : mshtml.HTMLDocumentClass
RawContentLength  : 9460

C'est bien en Json on retrouve le code 200 (ok) 
