namespace AppDomain.AppExceptions.Modules.ProductsModule
{
    public class ProductException : AppException
    {
        public ProductException(string message) : base(message)
        {
            Message = message;
        }

        public string Message { get; set; }
    }

    public class ProductExceptionMessage
    {
        static public readonly string EmptyPrice = "O valor do preço informado não pode ser nulo ou vazio.";
        static public readonly string WrongPrice = "O preço informado deve ser maior que 0.";
        static public readonly string EmptyIngredients = "O produto deve conter ingredientes. Quantidade atual inválida";
        static public readonly string WrongAmount = "A quantidade informada deve ser maior que 0.";
    }
}
