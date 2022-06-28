public  class Cats {
    public Cats() {

    }

public static string getCats(){
    Http http = new http();
    HttpRequest Request = new HttpRequest();

    Request.setEndpoint('https://cat-fact.herokuapp.com/facts/');
    Request.setMethod('GET');
    HttpResponse Responde = http.send(request);

    system.debug(Responde.getBody());
    return Responde.getBody();

  }
}