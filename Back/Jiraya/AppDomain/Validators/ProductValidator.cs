using AppDomain.AppExceptions.Modules.ProductsModule;

namespace AppDomain.Validators
{
    public class ProductValidator
    {
        public ProductValidator()
        {
            _priceContentValidator = new();
            _priceValidator = new();
            _ingredientValidator = new();
            _amountValidator = new();
            _priceContentValidator.NextValidator = _priceValidator;
        }
        private readonly PriceContentValidator _priceContentValidator;
        private readonly PriceValidator _priceValidator;
        private readonly IngredientValidator _ingredientValidator;
        private readonly AmountValidator _amountValidator;

        public void ValidatePrice(decimal price) => _priceContentValidator.Validate(price);
        public void ValidateIngredient(string item) => _ingredientValidator.Validate(item);
        public void ValidateAmount(int amount) => _amountValidator.Validate(amount);
    }

    internal class PriceContentValidator : BaseValidator
    {
        public override bool? Validate(decimal? price)
        {
            if (price != null)
            {
                return NextValidator?.Validate(price) ?? true;
            }
            throw new ProductException(ProductExceptionMessage.EmptyPrice);
        }
    }
    internal class PriceValidator : BaseValidator
    {
        public override bool? Validate(decimal? price)
        {
            if (price > 0)
            {
                return NextValidator?.Validate(price) ?? true;
            }
            throw new ProductException(ProductExceptionMessage.WrongPrice);
        }
    }
    internal class IngredientValidator : BaseValidator
    {
        public override bool? Validate(string? ingredient)
        {
            if (!string.IsNullOrEmpty(ingredient))
            {
                return NextValidator?.Validate(ingredient) ?? true;
            }
            throw new ProductException(ProductExceptionMessage.EmptyIngredients);
        }
    }
    internal class AmountValidator : BaseValidator
    {
        public override bool? Validate(int? amount)
        {
            if (amount >= 1)
            {
                return NextValidator?.Validate(amount) ?? true;
            }
            throw new ProductException(ProductExceptionMessage.WrongAmount);
        }
    }
}
