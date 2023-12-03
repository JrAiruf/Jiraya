namespace AppApplication.Modules.ProductModule.Dtos
{
    public class ProductDto
    {
        public ProductDto(Guid id, string name, decimal price, string[] ingreditents)
        {
            Id = id;
            Name = name;
            Price = price;
            Ingredients = ingreditents;
        }
        public Guid Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string[] Ingredients { get; set; }
    }
}
