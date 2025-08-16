using {shopBook} from '../db/schema';

service CatalogService {
    entity Books as projection on shopBook.Books actions {
            action submitOrder(quantity : Integer) returns {
                stock : Integer
            };
        };
        
	entity Sales as projection on shopBook.Sales;
    entity Authors as projection on shopBook.Authors;
}