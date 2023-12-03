using AppApplication.Modules.ProductModule.Dtos;
using AppDomain.Modules.ProductsModule.Entities;
namespace AppApplication.Modules.ProductModule.Extensions
{
    public static class ProductExtension
    {
        public static ProductDto AsDto(this Product product)
        {
            var ingredients = product.Ingredients.Split(",").Skip(1).ToArray();
            return new ProductDto(
                product.Id,
                product.Name,
                product.Price,
                ingredients
                );
        }
        public static Product AsEntity(this ProductDto product)
        {
            return new Product(
                product.Id,
                product.Name,
                product.Price,
                product.Ingredients
                );
        }
    }
}
