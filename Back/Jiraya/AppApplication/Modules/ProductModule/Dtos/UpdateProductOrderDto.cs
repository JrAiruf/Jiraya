namespace AppApplication.Modules.ProductModule.Dtos
{
    public class UpdateProductOrderDto
    {
        public UpdateProductOrderDto(Guid id,int amount, decimal totalValue)
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
