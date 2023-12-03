using AppApplication.Modules.ProductModule.Dtos;
using AppApplication.Modules.UserModule.Extensions;
using AppDomain.Modules.ProductsModule.Entities;

namespace AppApplication.Modules.ProductModule.Extensions
{
    public static class ProductOrderExtension
    {
        public static ProductOrderDto AsDto(this ProductOrder product)
        {
            return new ProductOrderDto(
                product.Id,
                product.Amount,
                product.TotalValue,
                product.Product.AsDto(),
                product.Customer.AsDto()
                );
        }
        public static OrderDto AsOrderDto(this ProductOrder product)
        {
            return new OrderDto(
                product.Id,
                product.Amount,
                product.TotalValue
                );
        }
    }
}
