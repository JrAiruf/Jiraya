using AppDomain.Modules.UserModule.Entities;
using AppDomain.Validators;

namespace AppDomain.Modules.ProductsModule.Entities
{
    public class ProductOrder : BaseEntity
    {
        private readonly ProductValidator _productValidator = new();

        public ProductOrder(int amount, decimal totalValue, Product product, Customer customer)
        {
            ChangeAmount(amount);
            ChangeTotalValue(totalValue);
            Product = product;
            Customer = customer;
        }
        public int Amount { get; private set; }
        public decimal TotalValue { get; private set; }
        public Product Product { get; private set; }
        public Customer Customer { get; private set; }

        public void ChangeAmount(int amount)
        {
            _productValidator.ValidateAmount(amount);
            Amount = amount;
        }

        public void ChangeTotalValue(decimal totalValue)
        {
            _productValidator.ValidatePrice(totalValue);
            TotalValue = totalValue;
        }

        public ProductOrder() { }
    }
}
