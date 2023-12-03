using AppDomain.Validators;

namespace AppDomain.Modules.ProductsModule.Entities
{
    public class Product : BaseEntity
    {
        ProductValidator _validator = new();

        public Product(string name, decimal price, string[] ingredients)
        {
            ChangeName(name);
            ChangePrice(price);
            ChangeIngredients(ingredients);
        }
        public Product(Guid id, string name, decimal price, string[] ingredients)
        {
            Id = id;
            ChangeName(name);
            ChangePrice(price);
            ChangeIngredients(ingredients);
        }
        public decimal Price { get; private set; }
        public string Ingredients { get; private set; }
        public ProductImage ProductImage { get; private set; }

        public void ChangePrice(decimal price)
        {
            Price = price;
            _validator.ValidatePrice(Price);
        }

        public void ChangeIngredients(string[] ingredients)
        {
            Ingredients = "";
            for (int i = 0; i < ingredients.Length; i++)
            {
                Ingredients = $"{Ingredients},{ingredients[i]}";
            }
            _validator.ValidateIngredient(Ingredients);
        }
        public void ChangeImage(ProductImage productImage)
        {
            if (productImage != null)
            {
                ProductImage = productImage;
            }
            throw new Exception("A Imagem não pode ser nula ou vazia.");
        }

        public Product() { }
    }
}
