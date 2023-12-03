namespace AppDomain.AppExceptions.Modules
{
    public class BaseException : AppException
    {
        public string Message { get; set; }
        public BaseException(string message) : base(message)
        {
            Message = message;
        }
    }

    public class BaseExceptionMessage
    {
        public static readonly string EmptyName = "A propriedade nome não pode ser vazia ou nula.";
    }
}
