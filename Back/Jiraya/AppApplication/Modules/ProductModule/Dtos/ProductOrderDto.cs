using AppApplication.Modules.UserModule.Dtos;

namespace AppApplication.Modules.ProductModule.Dtos
{
    public class ProductOrderDto
    {
        public ProductOrderDto(Guid? id, int amount,decimal totalValue, ProductDto product, CustomerDto customer)
        {
            Id = id;
            Amount = amount;
            TotalValue = totalValue;
            Product = product;
            Customer = customer;
        }
        public Guid? Id { get; private set; }
        public int Amount { get; private set; }
        public decimal TotalValue { get; private set; }
        public ProductDto? Product { get; private set; }
        public CustomerDto? Customer { get; private set; }
    }
}
