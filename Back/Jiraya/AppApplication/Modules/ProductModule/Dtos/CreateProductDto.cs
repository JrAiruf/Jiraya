namespace AppApplication.Modules.ProductModule.Dtos
{
    public class CreateProductDto
    {
        public CreateProductDto(string name, decimal price, UploadProductImageDto? productImage, string[] ingredients)
        {
            Name = name;
            Price = price;
            ProductImage = productImage;
            Ingredients = ingredients;
        }
        public string Name { get; private set; }
        public decimal Price { get; private set; }
        public UploadProductImageDto? ProductImage { get; private set; }
        public string[] Ingredients { get; private set; }
    }
}
