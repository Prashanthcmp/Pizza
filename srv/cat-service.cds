using my.PizzaShop as myPizzaShop from '../db/data-model';

service PizzaService {

    entity Products @odata.draft.enabled as projection on myPizzaShop.Products
    entity ProductsName @readonly as projection on myPizzaShop.ProductsName
    entity CategoryName @readonly as projection on myPizzaShop.CategoryName
    entity Orders @insertonly as projection on myPizzaShop.Orders

    annotate my.PizzaShop.Products with @(
        
        UI: {
            
            SelectionFields  : [
                ID,title,productName_ID,category_ID
            ],

            LineItem  : [
                {Value: ID, Label: 'Product ID'},
                {Value: title, Label: 'Product Title'},
                {Value: productName.name, Label: 'Product Name'},
                {Value: category.name, Label: 'Category Name'}
            ],

            HeaderInfo  : {
                $Type : 'UI.HeaderInfoType',
                TypeName : 'Products',
                TypeNamePlural : 'Products',
                Title: {Value: ID},
			    Description: {Value: title}
            },

            Facets  : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'GenaeralInfo',
                    Target : '@UI.FieldGroup#GeanralInfo',
                }
            ],

            FieldGroup#GeanralInfo: {
                Data: [
                    {Value:ID, Label: 'Prodcut ID'},
                    {Value:title, Label: 'Product Title'}
                ]
            }
        }
    ) {

	productName @ValueList.entity:'ProductsName';
    ID @ValueList.entity:'Products';
    category @ValueList.entity:'CategoryName'
};
  
    
}