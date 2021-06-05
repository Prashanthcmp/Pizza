using { Country, managed } from '@sap/cds/common';

//Start building service
//---PizzaService is my service name defined by user
service PizzaService {

    entity Products {
        key ProductId : Integer;
        ProductName : localized String(20);
        category : Association to Categories;
    }

    entity Categories {
        key CategoryId : Integer;
        CategoryName : localized String(20);
        ProductCategory : Association to  Products on ProductCategory.category = $self
    }

}