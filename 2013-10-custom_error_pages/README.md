as show in http://railscasts.com/episodes/53-handling-exceptions-revised
here is the code for custom error pages.


### Developing

for testing `500` you can raise this in your controllers

     raise ActiveResource::BadRequest
    
for testing `404` just type wrong url into browser


### Generate public pages

    rake error_pages:generate
    
will generate error pages to `public/` dir 


### Info

Rails: 3.2.14

published:  2013-10
