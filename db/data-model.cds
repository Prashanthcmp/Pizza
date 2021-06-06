
namespace my.PizzaShop;

using { Country, managed } from '@sap/cds/common';


  entity Products : managed {
    @Common.Label: 'Product'
    key ID : Integer;
    @Common.Label: 'Product Name'
    title  : localized String;
    @Common.Label: 'Category'
    category : Association to CategoryName;
    amount : Integer;
  }

  entity ProductVH  {
      key ID : Integer;
      ProductName : String;
  }

  entity CategoryName  {
      key ID : Integer;
      name : String;
      category : Association to many Products on category.category = $self;
  }

  entity Orders : managed {
    key ID  : UUID;
    book    : Association to Products;
    country : Country;
    amount  : Integer;
  }

