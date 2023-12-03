namespace AppApplication.Modules.ProductModule.Dtos
{
    public class OrderDto
    {
        public OrderDto(Guid id, int amount, decimal totalValue)
        {
            Id = id;
            Amount = amount;
            TotalValue = totalValue;
        }
        public Guid Id { get; private set; }
        public int Amount { get; private set; }
        public decimal TotalValue { get; private set; }
    }
}
