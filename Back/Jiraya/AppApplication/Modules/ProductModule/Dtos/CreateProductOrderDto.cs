namespace AppApplication.Modules.ProductModule.Dtos
{
    public class CreateProductOrderDto
    {
        public CreateProductOrderDto(Guid productId, Guid customerId, int amount, decimal totalValue)
        {
            ProductId = productId;
            CustomerId = customerId;
            Amount = amount;
            TotalValue = totalValue;
        }

        public Guid ProductId { get; private set; }
        public Guid CustomerId { get; private set; }
        public int Amount { get; private set; }
        public decimal TotalValue { get; private set; }
    }
}
