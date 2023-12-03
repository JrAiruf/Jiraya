namespace AppApplication.Modules.ProductModule.Dtos
{
    public class UpdateProductDto
    {
        public UpdateProductDto(Guid id, string name, decimal price, string[] ingredients)
        {
            Id = id;
            Name = name;
            Price = price;
            Ingredients = ingredients;
        }
        public Guid Id { get; private set; }
        public string Name { get; private set; }
        public decimal Price { get; private set; }
        public string[] Ingredients { get; private set; }
    }
}
