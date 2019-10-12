"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var http_1 = require("@angular/common/http");
var ApiBase = /** @class */ (function () {
    function ApiBase() {
    }
    //constructor(private client: HttpClient) { }
    //public getMany(url: string): Observable<T[]> {
    //  const header = this.createHeader();
    //  return this.client.get<T[]>(url, { headers: header });
    //}
    ApiBase.prototype.createHeader = function () {
        var head = new http_1.HttpHeaders({
            'Content-Type': 'application/json'
        });
        return head;
    };
    return ApiBase;
}());
exports.ApiBase = ApiBase;
//# sourceMappingURL=base.api.js.map