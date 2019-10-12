import { HttpHeaders } from "@angular/common/http";

export abstract class ApiBase {

  //constructor(private client: HttpClient) { }

  //public getMany(url: string): Observable<T[]> {
  //  const header = this.createHeader();

  //  return this.client.get<T[]>(url, { headers: header });
  //}

  protected createHeader(): HttpHeaders {
    const head = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    return head;
  }
}
