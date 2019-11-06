export interface ICityMapRow {
  rowNumber: number;
  cityMaps: ICityMap[];
}

export interface ICityMap {
  id: number;
  city: any;
  cityMapType: ICityMapType;
  cityMapZone: ICityMapZone;
  xCoordinate: number;
  yCoordinate: number;
  name: string;
  level: number;
}

export interface ICityMapType {
  id: number;
  name: string;
  officialName: string;
  fictionalName: string;
}

export interface ICityMapZone {
  id: number;
  name: string,
  officialName: string,
  fictionalName: string,
  cityMapType: ICityMapType;
}
