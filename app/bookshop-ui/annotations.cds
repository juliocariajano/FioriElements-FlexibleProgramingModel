using { shopBook as db } from ../db/schema;

service CatalogService @(path:'/catalog') {
  entity Books   as projection on db.Books;
  entity Authors as projection on db.Authors;
  entity Genres  as projection on db.Genres;
  entity Sales   as projection on db.Sales;
}
